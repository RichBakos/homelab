#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Reload systemctl services
sudo systemctl daemon-reload

# Enable systemctl services
sudo systemctl enable coredns
sudo systemctl enable consul
sudo systemctl enable nomad

# Clean out tmp
sudo find /tmp -type f -atime +10 -delete

# Finish
exit 0