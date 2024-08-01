#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Install Gluster client, Consul and Nomad
sudo apt-get update && apt-get install -y glusterfs-client consul nomad

# Add Gluster hosts to Hosts
sudo echo "172.16.20.201 pmx201.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.202 pmx202.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.203 pmx203.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Add gluster mount in fstab
sudo echo "172.16.20.202:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=172.16.20.203 0 0" >> /etc/fstab

# Remove Nomad and Consul defaults
sudo rm /etc/consul.d/*
sudo rm /etc/nomad.d/*

# Copy config files to destination
sudo cp /tmp/configs/cloud/* /etc/cloud/
sudo cp /tmp/configs/consul/* /etc/consul.d/

# Reload and enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable consul

# Finish
exit 0