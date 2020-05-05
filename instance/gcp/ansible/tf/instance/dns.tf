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

data "google_dns_keys" "ministackdev_dns_keys" {
  managed_zone = google_dns_managed_zone.ministackdev.id
}
