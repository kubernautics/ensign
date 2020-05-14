resource "google_compute_firewall" "ssh-server-public" {
  name           = "ensign-default-allow"
  network        = "default"
  source_ranges  = ["0.0.0.0/0"]
  project         = var.project_name
  target_tags    = ["ssh-service-public"]
  allow {
    protocol     = "tcp"
    ports        = ["22"]
  }
}

resource "google_compute_firewall" "wireguard" {
  name           = "wireguard"
  network        = "default"
  source_ranges  = ["0.0.0.0/0"]
  project         = var.project_name
  target_tags    = ["ensign"]
  allow {
    protocol     = "udp"
    ports        = ["51820"]
  }
}

resource "google_compute_firewall" "ensign" {
  name           = "ensign"
  network        = "default"
  source_ranges  = ["0.0.0.0/0"]
  project         = var.project_name
  target_tags    = ["ensign"]
  allow {
    protocol     = "tcp"
    ports        = ["8443", "8081", "443", "8080", "8000", "80", "22021"]
  }
}
