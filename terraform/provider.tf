terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

# configure the DigitalOcean provider and specify the credentials
# for DigitalOcean account by assigning the do_token to the token
# argument of the provider
provider "digitalocean" {
  token = var.do_token
}

# Terraform automatically add existing SSH key to any new Droplets
data "digitalocean_ssh_key" "terraform" {
  name = var.do_ssh_key_name
}
