# -[Instance]----------------------------------------------------------
resource "digitalocean_droplet" "bitleaf_server_1" {
  name   = "ensign"
  image  = var.droplet_image
  region = var.region
  size   = var.droplet_size
  private_networking = var.private_networking
  ssh_keys = [
    var.ssh_key_fingerprint
  ]
  # user_data = data.template_file.cloud-init-yaml.rendered
}

resource "digitalocean_volume_attachment" "ensign_lxd" {
  droplet_id = digitalocean_droplet.ensign.id
  volume_id  = digitalocean_volume.ensign_lxd.id
}

resource "digitalocean_volume" "ensign_lxd" {
  size                    = 16
  name                    = ensign_lxd
  region                  = var.region
  initial_filesystem_type = "none"
  description             = "ensign lxd block storage"
}

output "public_ip_server" {
  value = digitalocean_droplet.ensign.ipv4_address
}
