TF_LOG = 1
terraform = terraform -chdir=terraform

init:
	$(terraform) init

plan:
	$(terraform) plan 

apply:
	$(terraform) apply

show:
	$(terraform) show terraform.tfstate

destroy:
	$(terraform) plan -destroy -out=terraform.tfplan
	$(terraform) apply terraform.tfplan
