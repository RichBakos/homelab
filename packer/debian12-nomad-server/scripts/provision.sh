#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

sudo apt-get update && apt-get install  -y consul nomad

# Remove Nomad and Consul defaults
sudo rm /etc/consul.d/*
sudo rm /etc/nomad.d/*

# Copy config files to destination
sudo cp /tmp/configs/consul/server.hcl /etc/consul.d/consul.hcl
sudo cp /tmp/configs/nomad/server.hcl /etc/nomad.d/nomad.hcl

# Reload and enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable consul nomad

# Finish
exit 0