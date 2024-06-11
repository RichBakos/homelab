# Load .env files
include .envrc

help:##.................Show help
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed 's/^/    /'
	@echo ""

.PHONY: set-vars-%
set-vars-%:##........Create/update vars for a specific job
	nomad var put -force @$*/env.vars.hcl

.PHONY: set-global-vars
set-global-vars:##...Create/update global vars
	find . -type f -name global.env.vars.hcl | sed -e 's,^\./,,' > vars.txt
	cat vars.txt | while read line; do nomad var put -force "@$$line"; done;

.PHONY: set-all-vars
set-all-vars:##......Create/update all global and job variables
	find . -type f -name global.env.vars.hcl | sed -e 's,^\./,,' > vars.txt	
	cat vars.txt | while read line; do nomad var put -force "@$$line"; done;
	find . -type f -name env.vars.hcl | sed -e 's,^\./,,' > vars.txt	
	cat vars.txt | while read line; do nomad var put -force "@$$line"; done;

.PHONY: deploy-%
deploy-%:##..........Deploy a specific job
	nomad job run $*/nomad.job

.PHONY: deploy-all-jobs
deploy-all-jobs:##...Deploy all jobs
	find . -type f -name nomad.job | sed -e 's,^\./,,' > jobs.txt	
	cat jobs.txt | while read line; do nomad run "$$line"; done;
