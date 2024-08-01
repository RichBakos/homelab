#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

sudo apt-get update && apt-get install  -y glusterfs-client vault

# Gluster hosts
sudo echo "172.16.20.201 pmx201.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.202 pmx202.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl
sudo echo "172.16.20.203 pmx203.bakos.lan" >> /etc/cloud/templates/hosts.debian.tmpl

# Add gluster mount in fstab
sudo echo "172.16.20.202:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=172.16.20.203 0 0" >> /etc/fstab

# Reload and enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable vault

# Finish
exit 0