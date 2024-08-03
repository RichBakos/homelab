include .env

init:
	cd terraform && terraform init

init-upgrade:
	cd terraform && terraform init -upgrade

plan:
	cd terraform && terraform plan

apply:
	cd terraform && terraform apply --auto-approve

terraform-format:
	cd terraform && terraform fmt -recursive -check

nomad-format:
	cd terraform/nomad && nomad fmt -recursive -check

validate-jobs:
	./terraform/scripts/validate-jobs.sh

build-%:
	cd packer/debian12-$* && packer build .


