#resource "google_compute_firewall" "ssh-server-public" {
#  name           = "default-allow-ssh"
#  network        = "default"
#  source_ranges  = ["0.0.0.0/0"]
#  target_tags    = ["ssh-service-public"]
#  project         = var.project_id
#  allow {
#    protocol     = "tcp"
#    ports        = ["22"]
#  }
#}

