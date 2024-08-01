#!/usr/bin/env bash
set -e

for JOB in $(find ./terraform/nomad/jobs -type f -name '*.hcl' | sort | uniq)  ; do
  nomad job validate "$JOB"
done