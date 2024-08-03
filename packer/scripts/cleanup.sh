#!/usr/bin/env bash

set -o errexit

DEBIAN_FRONTEND=noninteractive

# Clean out tmp.
sudo find /tmp -type f -atime +10 -delete

# Lock down root
sudo passwd -d root && sudo passwd -l root 

# Finish
exit 0