# Load .env files
include .envrc

help:##............Show help
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed 's/^/    /'
	@echo ""

.PHONY: deploy-global-vars
deploy-global-vars:##........Deploy specific job from sub folder
	find . -type f -name globalvars.hcl -exec echo nomad var put -force @{} \;


.PHONY: deploy-%
deploy-%:##........Deploy specific job from sub folder
	[ -f $*/jobvars.hcl ] && nomad var put -force @$*/jobvars.hcl || echo ==> no $* variables
	nomad job run $*/nomad.job

.PHONY: deploy-all
deploy-all:##........Deploy specific job from sub folder
	find . -type f -name globalvars.hcl -exec echo nomad var put -force @{} \;
	find . -type f -name jobvars.hcl | sed -e 's,^\./,,' > vars.txt
	cat vars.txt | while read line; do nomad var put -force "@$line"; done;
	find . -type f -name jobvars.hcl | sed -e 's,^\./,,' > jobs.txt	
	cat jobs.txt | while read line; do nomad run "$line"; done;
	
