resource "google_dns_managed_zone" "ministackdev" {

  name        = "ministackdev"
  dns_name    = "ministack.dev."

  project     = "ministackdev"
  description = "Ministack Dev Domain"

  labels = {
    deployment = "dev"
  }

  dnssec_config {
    state         = "on"
    non_existence = "nsec3"
  }

}

resource "google_compute_address" "ensign_public_ipv4" {
  name = "ensign-public-ipv4"
}

resource "google_dns_record_set" "ensign" {
  name = "ensign.ministack.dev."
  type = "A"
  ttl  = 300
  managed_zone = "ministackdev"
  rrdatas = ["${google_compute_address.ensign_public_ipv4.address}"]
  //rrdatas = ["${google_compute_address.ensign_public_ipv4.network_interface.0.access_config.0.nat_ip}"]
}

data "google_dns_keys" "ministackdev_dns_keys" {
  managed_zone = google_dns_managed_zone.ministackdev.id
}
