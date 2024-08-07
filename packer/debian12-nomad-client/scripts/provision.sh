#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Install gluster client, docker, consl and nomad.
sudo apt-get update && apt-get install -y glusterfs-client docker-ce consul nomad

# Gluster hosts.
sudo echo "172.16.20.201 pmx201.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.202 pmx202.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.203 pmx203.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Add gluster mount in fstab
sudo echo "172.16.20.202:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=172.16.20.203 0 0" >> /etc/fstab

# Remove nomad and consul defaults
sudo rm /etc/consul.d/*
sudo rm /etc/nomad.d/*

# Copy config files to destination
sudo cp /tmp/configs/consul/client.hcl /etc/consul.d/consul.hcl
sudo cp /tmp/configs/nomad/client.hcl /etc/nomad.d/nomad.hcl
sudo cp /tmp/configs/nomad/volumes.hcl /etc/nomad.d/

# Reload and enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable consul nomad

# Add a media user
sudo /sbin/groupadd -g 1010 media
sudo /sbin/useradd -M -u 1010 -g 1010 media
sudo /sbin/usermod -L media

# Finish
exit 0