resource "google_compute_firewall" "ssh-server-public" {
  name           = "ensign-default-allow"
  network        = "default"
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["ssh-service-public"]
  project         = var.project_name
  allow {
    protocol     = "tcp"
    ports        = ["22", "8443"]
  }
}

