# Input Variables
# https://developer.hashicorp.com/terraform/language/values/variables#values-for-undeclared-variables

# DigitalOcean
variable "do_token" {
  type = string
}

variable "do_ssh_key_name" {
  type = string
}

variable "do_droplet_region" {
  type = string
}

variable "do_droplet_size" {
  type = string
}

# OpenSSH
# private key location
variable "pvt_key" {
  type = string
}

# public key location for ansible playbook
variable "pub_key" {
  type = string
}
