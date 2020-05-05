resource "google_compute_instance" "ensign" {

  name            = var.instance_name
  zone            = var.region
# project         = var.project_name
  hostname        = var.hostname
  machine_type    = var.ensign_type
  can_ip_forward  = true
  #metadata_startup_script = "sudo apt-get update && sudo apt-get upgrade -y"
  tags                    = ["ensign", "ministackdev", "ssh-service-public"]

  boot_disk {
    initialize_params {
      image = var.instance_os
    }
  }

#  attached_disk {
#    device_name = "google_compute_disk.volume_ensign_sda.lxd"
#    source = "google_compute_disk.volume_ensign_sda.lxd"
#  }

  network_interface {
    network = "default"
    access_config {
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
    ssh-keys              = "kmorgan:${file("~/.ssh/id_rsa.pub")}"
    startup-script        = "${module.startup-script-lib.content}"
    startup-script-custom = file("${path.module}/bin/startup-ubuntu.sh")
  }
}

#resource "google_compute_disk" "volume_ensign_sda" {
#  name    = "volume_ensign_sda"
#  type    = "pd-standard"
#  zone    = var.region
#  size    = var.size_volume_lxd
#  project = var.project_id
#}

#resource "google_compute_attached_disk" "ensign" {
#  disk     = google_compute_disk.volume_ensign_sda.id
#  instance = google_compute_instance.ensign.id
#}

resource "google_dns_record_set" "ensign" {
  name = "ensign.ministack.dev."
  type = "A"
  ttl  = 300

  managed_zone = "ministackdev"

  rrdatas = ["${google_compute_instance.ensign.network_interface.0.access_config.0.nat_ip}"]

}

output "public_ipv4" {
  value = google_compute_instance.ensign.network_interface.0.access_config.0.nat_ip
}
