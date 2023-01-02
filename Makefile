# include .env
export

init:
	source ./env-init.sh
	cp terraformrc ~/.terraformrc
	terraform init
apply:
	terraform apply -auto-approve
destroy:
	terraform destroy -auto-approve
redeploy:
	terraform destroy -auto-approve
	terraform apply -auto-approve
plan:
	terraform plan -out=tfplan