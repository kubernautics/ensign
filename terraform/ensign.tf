# -[Instance]----------------------------------------------------------

resource "digitalocean_volume" "ensignlxdvol16" {
  region                  = var.region
  name                    = "ensignlxdvol16"
  size                    = 16
  description             = "ensign lxd block storage"
}

resource "digitalocean_droplet" "ensign" {
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

resource "digitalocean_volume_attachment" "ensignlxdvol16" {
  droplet_id = digitalocean_droplet.ensign.id
  volume_id  = digitalocean_volume.ensignlxdvol16.id
}

output "public_ip_server" {
  value = digitalocean_droplet.ensign.ipv4_address
}
