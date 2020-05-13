variable "instance_name" {
  default     = "ensign"
}

variable "base_domain" {
  default     = "ministack.dev"
}

variable "project_name" {
  default     = "ministackdev"
  description = "The project ID to deploy resource into"
}

variable "hostname" {
  default     = "ensign.ministack.dev"
  description = "Ensign Instance Name"
}

variable "instance_os" {
  default = "ubuntu-os-cloud/ubuntu-2004-lts"
 #default = "centos-cloud/centos-8"
}

variable "ensign_type" {
  default     = "e2-small"
}

variable "size_volume_lxd" {
  default = "8"
}

variable "region" {
  default = "us-west3"
  description = "The GCP region to deploy instances into"
  // https://cloud.google.com/compute/docs/regions-zones
}

#variable "tfstate" {
#  type = string
#  default = "var.home/.ccio/state/"
#}
