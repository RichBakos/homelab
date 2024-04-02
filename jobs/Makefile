# Load .env files
include .envrc
export

help:##............Show help
	@echo ""
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed 's/^/    /'
	@echo ""

<<<<<<< HEAD
.PHONY: deploy-global-vars
deploy-global-vars:##........Deploy global variables
=======
.PHONY: deploy-global-vars%
deploy-global-vars%:##........Deploy global variables
>>>>>>> 88daa8f (added job variables)
	find . -type f -name globalvars.hcl -exec echo nomad var put -force @{} \;


.PHONY: deploy-%
<<<<<<< HEAD
deploy-%:##........Deploy a specific jobs and its variables
	[ -f $*/jobvars.hcl ] && nomad var put -force @$*/jobvars.hcl || echo ==> no $* variables
	nomad job run $*/nomad.job

.PHONY: deploy-all
deploy-all:##........Deploy all jobs in directory tree
=======
deploy-%:##........Deploy a specific job from the directory tree
	[ -f $*/jobvars.hcl ] && nomad var put -force @$*/jobvars.hcl || echo ==> no $* vars
	nomad job run $*/nomad.job

.PHONY: deploy-all
deploy-all:##........Deploy all jobs in the directory tree
>>>>>>> 88daa8f (added job variables)
	find . -type f -name globalvars.hcl -exec echo nomad var put -force @{} \;
	find . -type f -name jobvars.hcl | sed -e 's,^\./,,' > vars.txt
	cat vars.txt | while read line; do nomad var put -force "@$line"; done;
	find . -type f -name jobvars.hcl | sed -e 's,^\./,,' > jobs.txt	
	cat jobs.txt | while read line; do nomad run "$line"; done;
	
