# Load .env files
include .envrc

help:##............Show help
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed 's/^/    /'
	@echo ""

.PHONY: deploy-globals-vars%
deploy-%:##........Deploy specific job from sub folder
	for i in find . -type f -name globalvars.hcl -exec echo {} \; nomad var put -force @$i 


.PHONY: deploy-%
deploy-%:##........Deploy specific job from sub folder
	[ -f $*/jobvars.hcl ] && nomad var put -force @$*/jobvars.hcl || echo ==> no $* variables
	nomad job run $*/nomad.job

.PHONY: deploy-all%
deploy-all-%:##........Deploy specific job from sub folder
	for i in find . -type f -name jobvars.hcl -exec echo {} \; nomad var put -force @$i 
	for i in find . -type f -name nomad.job -exec echo {} \; nomad job run $i
	
