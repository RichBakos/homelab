nomad-validate:
	./scripts/validate-jobs.sh

init:
	cd terraform && terraform init

init-upgrade:
	cd terraform && terraform init -upgrade

plan:
	cd terraform && terraform plan

apply:
	cd terraform && terraform apply

format:
	cd terraform && terraform fmt -recursive -check