#!/usr/bin/env bash
set -e


for JOB in $(find ~/homelab/terraform -type f -name '*.hcl' ! -name .terraform.lock.hcl | sort | uniq)  ; do
  nomad job validate "$JOB"
done
