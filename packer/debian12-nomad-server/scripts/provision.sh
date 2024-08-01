#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

sudo apt-get update && apt-get install  -y consul nomad

# Remove Nomad and Consul defaults
sudo rm /etc/consul.d/*
sudo rm /etc/nomad.d/*

# Copy config files to destination
sudo cp /tmp/configs/cloud/* /etc/cloud/
sudo cp /tmp/configs/consul/* /etc/consul.d/
sudo cp /tmp/configs/nomad/* /etc/nomad.d/

# Reload and enable systemd services
sudo systemctl daemon-reload
sudo systemctl enable consul nomad

# Finish
exit 0