#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

COREDNS_VERSION='1.11.1'

dpkg --configure -a

# Add HashiCorp repo and install consul, nomad
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt-get update && apt-get install  -y consul nomad

# Add CoreDNS
sudo wget https://github.com/coredns/coredns/releases/download/v${COREDNS_VERSION}/coredns_${COREDNS_VERSION}_linux_amd64.tgz -O /tmp/coredns.tgz
sudo tar -xvvf /tmp/coredns.tgz --directory /tmp
sudo chmod +x /tmp/coredns
sudo mv /tmp/coredns /usr/local/bin
sudo mkdir -p /opt/coredns /etc/coredns
sudo useradd -d /var/lib/coredns -m coredns
sudo chown coredns:coredns /opt/coredns

# Remove Nomad and Consul defaults
sudo rm /etc/consul.d/*
sudo rm /etc/nomad.d/*

# Copy config files to destination
sudo cp /tmp/configs/cloud/* /etc/cloud/
sudo cp /tmp/configs/consul/* /etc/consul.d/
sudo cp /tmp/configs/coredns/corefile /etc/coredns/
sudo cp /tmp/configs/coredns/coredns.service /etc/systemd/system/

# Populate resolv.conf
sudo echo 'nameserver 127.0.0.1' > /etc/resolv.conf

# Reload systemctl services
sudo systemctl daemon-reload

# Enable systemctl services
sudo systemctl enable coredns
sudo systemctl enable consul
sudo systemctl enable nomad
sudo mount -a

# Clean out tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0