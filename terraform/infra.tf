# the configuration for the Droplet
#   http://www.terraform.io/docs/providers/do/r/droplet
# size
#   https://slugs.do-api.dev
# ssh_keys
#   specifies a list of public keys to add to the Droplet
# connection
#   set up a connection that Terraform can use to connect to the server via SSH
resource "digitalocean_droplet" "infra" {
    image = "ubuntu-22-10-x64"
    name = "infra"
    region = var.do_droplet_region
    size = var.do_droplet_size
    ssh_keys = [
      data.digitalocean_ssh_key.terraform.id
    ]

  connection {
    host        = self.ipv4_address
    type        = "ssh"
    user        = "root"
    private_key = file(var.pvt_key)
  }

  provisioner "remote-exec" {
    inline = ["echo Done!"]
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' ../ansible/playbook.yml | less"
  }

  provisioner "remote-exec" {
    inline = ["systemctl reboot"]
  }
}
