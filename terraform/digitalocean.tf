# -----------------------------------------------------------------------
# -[Provider: DigitalOcean]----------------------------------------------

variable "digitalocean_token" {}
provider "digitalocean" {
  token = "${var.digitalocean_token}"
}

# -----------------------------------------------------------------------
# -[Instance Authentication]---------------------------------------------

variable "digitalocean_token" {}
variable "ssh_key_fingerprint" {
  token = "${var.digitalocean_fprint}"
}

variable "ssh_public_key" {
  description = "Local public ssh key"
  default = "~/.ssh/id_rsa.pub"
}


# -----------------------------------------------------------------------
# -[Instance]------------------------------------------------------------

variable "droplet_size" {
  description = "Droplet size for server"
  default = "s-2vcpu-2gb"
}

variable "droplet_image" {
  description = "DigitalOcean droplet image name"
  default = "ubuntu-20-04-x65"
}

variable private_networking {
  default = "false"
}

# -----------------------------------------------------------------------
# -[Region]--------------------------------------------------------------

# https://www.digitalocean.com/docs/platform/availability-matrix/
variable "region" {
  description = "Digital Ocean Region"
  default = "sfo1"
# default = "sfo2"
# default = "nyc1"
# default = "nyc2"
# default = "nyc3"
# default = "ams2"
# default = "ams3"
# default = "sgp1"
# default = "lon1"
# default = "fra1"
# default = "tor1"
# default = "blr1"
}

##########################################################################
# Refrence:
#
# curl -X GET --silent "https://api.digitalocean.com/v2/sizes" -H "Authorization: Bearer $TOKEN" \
#   | jq \
#   | tee /tmp/size_do.list ; vim /tmp/size_do.list

