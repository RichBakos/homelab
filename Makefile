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
nomad-validate:
	./scripts/validate-jobs.sh

init:
	terraform init

init-upgrade:
	terraform init -upgrade

plan:
	terraform plan

apply:
	terraform apply

format:
	terraform fmt -recursive -check