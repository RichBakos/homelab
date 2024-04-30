# Load .env files
include .envrc

help:##.................Show help
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed 's/^/    /'
	@echo ""

.PHONY: set-global-vars
set-global-vars:##...Create/update global vars
	find . -type f -name globalvars.hcl | sed -e 's,^\./,,' > vars.txt
	cat vars.txt | while read line; do nomad var put -force "@$$line"; done;

.PHONY: set-vars-%
set-vars-%:##........Create/update vars for a specific job
	nomad var put -force "@$*/jobvars.hcl

.PHONY: deploy-%
deploy-%:##..........Deploy a specific job
	nomad job run $*/nomad.job

.PHONY: deploy-all-jobs
deploy-all-jobs:##...Deploy all global variable. job variable and jobs
	find . -type f -name nomad.job | sed -e 's,^\./,,' > jobs.txt	
	cat jobs.txt | while read line; do nomad run "$$line"; done;
