include .env

nomad-validate:
	./scripts/validate-jobs.sh

init:
	cd terraform && terraform init

init-upgrade:
	cd terraform && terraform init -upgrade

plan:
	cd terraform && terraform plan

apply:
	cd terraform && terraform apply --auto-approve

format:
	cd terraform && terraform fmt -recursive -check

build-%:
	cd packer/debian12-$* && packer build .
