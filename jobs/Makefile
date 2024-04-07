# Load .env files
include .envrc

help:##.................Show help
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed 's/^/    /'
	@echo ""

.PHONY: deploy-global-vars
deploy-global-vars:##...Deploy global vars
	find . -type f -name globalvars.hcl -exec echo nomad var put -force @{} \;

.PHONY: deploy-vars-%
deploy-vars-%:##........Deploy vars for a specific job
	nomad var put -force @$*/jobvars.hcl

.PHONY: deploy-all-vars
deploy-all-vars:##......Deploy all vars for all jobs
	find . -type f -name globalvars.hcl -exec echo nomad var put -force @{} \;
	find . -type f -name jobvars.hcl | sed -e 's,^\./,,' > vars.txt
	cat vars.txt | while read line; do nomad var put -force "@$line"; done;

.PHONY: deploy-%
deploy-%:##.............Deploy a specific job
	nomad job run $*/nomad.job

.PHONY: deploy-all-jobs
deploy-all-jobs:##......Deploy all jobs
	find . -type f -name nomad.job | sed -e 's,^\./,,' > jobs.txt	
	cat jobs.txt | while read line; do nomad run "$line"; done;
	
