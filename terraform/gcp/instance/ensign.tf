
resource "google_compute_instance" "ensign" {

  name            = var.instance_name
  zone            = var.tfzone
# project         = var.project_name
  hostname        = var.hostname
  machine_type    = var.ensign_type
  can_ip_forward  = true
  tags                    = ["ensign", "ministackdev", "ssh-service-public"]

  boot_disk {
    initialize_params {
      image = var.instance_os
    }
  }

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.primary_public_ipv4.address
    }
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }
  metadata = {
    serial-port-logging-enable = "TRUE"
    ssh-keys                   = "kmorgan:${file("~/.ssh/id_rsa.pub")}"
    startup-script             = "${module.startup-script-lib.content}"
    startup-script-custom      = file("${path.module}/bin/startup-centos.sh")
  }
}

resource "google_compute_address" "primary_public_ipv4" {
  name = "primary-public-ipv4"
}

resource "google_dns_record_set" "ensign" {
  name = "ensign.ministack.dev."
  type = "A"
  ttl  = 300
  managed_zone = "ministackdev"
  rrdatas = ["${google_compute_address.primary_public_ipv4.address}"]
  //rrdatas = ["${google_compute_address.primary-public-ipv4.network_interface.0.access_config.0.nat_ip}"]
}

data "google_compute_instance_serial_port" "serial" {
  instance = google_compute_instance.ensign.name
  project         = var.project_name
  zone            = var.tfzone
  port = 1
}

output "public_ipv4" {
  value = google_compute_instance.ensign.network_interface.0.access_config.0.nat_ip
}

#resource "google_compute_disk" "volume_ensign_sda" {
#  name    = "volume_ensign_sda"
#  type    = "pd-standard"
#  zone    = var.tfregion
#  size    = var.size_volume_lxd
#  project = var.project_id
#}
#resource "google_compute_attached_disk" "ensign" {
#  disk     = google_compute_disk.volume_ensign_sda.id
#  instance = google_compute_instance.ensign.id
#}
