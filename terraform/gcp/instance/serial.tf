data "google_compute_instance_serial_port" "serial" {
  project  = var.project_name
  instance = google_compute_instance.ensign.name
  zone     = google_compute_instance.ensign.zone
  port = 1
}

