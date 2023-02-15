TF_LOG=1

init:
	terraform init

# to see the execution plan, or what Terraform will attempt 
# to do to build the infrastructure you described
plan:
	terraform plan 

# the `+ resource "digitalocean_droplet" "www-1"` line means that
# Terraform will create a new Droplet resource called www-1,
# with the details that follow it. That’s exactly what should happen,
# so run terraform apply command to execute the current plan:
apply:
	terraform apply

# to view the current state of your environment
show:
	terraform show terraform.tfstate

destroy:
	terraform plan -destroy -out=terraform.tfplan
	terraform apply terraform.tfplan
