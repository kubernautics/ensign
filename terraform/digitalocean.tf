# -----------------------------------------------------------------------
# -[Provider: DigitalOcean]----------------------------------------------

variable "digitalocean_token" {
  description = "DigitalOcean Api Token"
}

provider "digitalocean" {
  token = var.digitalocean_token
}

# -----------------------------------------------------------------------
# -[Instance Authentication]---------------------------------------------

variable "ssh_key_fingerprint" {
  description = "Fingerprint of the public ssh key stored on DigitalOcean"
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
  description = "DigitalOcean Ensign Image Name"
  default = "ubuntu-20-04-x64"
}

variable private_networking {
  default = "false"
}

# -----------------------------------------------------------------------
# -[Region]--------------------------------------------------------------

# https://www.digitalocean.com/docs/platform/availability-matrix/
variable "region" {
  description = "Digital Ocean Region"
# default = "sfo1"
  default = "sfo2"
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

