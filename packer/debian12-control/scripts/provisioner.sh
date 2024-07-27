#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

COREDNS_VERSION='1.11.1'

dpkg --configure -a

# Add Gluster client
wget -O - https://download.gluster.org/pub/gluster/glusterfs/9/rsa.pub | gpg --dearmor > /etc/apt/trusted.gpg.d/gluster.gpg
DEBID=$(grep 'VERSION_ID=' /etc/os-release | cut -d '=' -f 2 | tr -d '"')
DEBVER=$(grep 'VERSION=' /etc/os-release | grep -Eo '[a-z]+')
DEBARCH=$(dpkg --print-architecture)
echo "deb [signed-by=/etc/apt/trusted.gpg.d/gluster.gpg] https://download.gluster.org/pub/gluster/glusterfs/LATEST/Debian/${DEBID}/${DEBARCH}/apt ${DEBVER} main" > /etc/apt/sources.list.d/gluster.list
sudo apt-get update && apt-get install -y glusterfs-client

# Add HashiCorp repo and install consul, nomad
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && apt-get install  -y consul

# Install CoreDNS
sudo wget https://github.com/coredns/coredns/releases/download/v${COREDNS_VERSION}/coredns_${COREDNS_VERSION}_linux_amd64.tgz -O /tmp/coredns.tgz
sudo tar -xvvf /tmp/coredns.tgz --directory /tmp
sudo chmod +x /tmp/coredns
sudo mv /tmp/coredns /usr/local/bin
sudo mkdir -p /opt/coredns /etc/coredns
sudo useradd -d /var/lib/coredns -m coredns
sudo chown coredns:coredns /opt/coredns

# Remove Nomad and Consul defaults
sudo rm /etc/consul.d/*

# Copy config files to destination
sudo cp /tmp/configs/cloud/* /etc/cloud/
sudo cp /tmp/configs/consul/* /etc/consul.d/
sudo cp /tmp/configs/coredns/corefile /etc/coredns/
sudo cp /tmp/configs/coredns/coredns.service /etc/systemd/system/

# Add gluster mount in fstab
sudo echo "172.16.20.202:/data /mnt glusterfs defaults,_netdev,noauto,x-systemd.automount,backupvolfile-server=172.16.20.203 0 0" >> /etc/fstab

# Add a media user
sudo /sbin/groupadd -g 1010 media
sudo /sbin/useradd -M -u 1010 -g 1010 media
sudo /sbin/usermod -L media

# Populate resolv.conf
sudo echo 'nameserver 127.0.0.1' > /etc/resolv.conf

# Reload systemctl services
sudo systemctl daemon-reload

# Enable systemctl services
sudo systemctl enable coredns
sudo systemctl enable consul
sudo mount -a

# Clean out tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0