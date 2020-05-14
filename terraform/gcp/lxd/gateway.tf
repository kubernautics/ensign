resource "lxd_container" "gateway" {
  config     = {}
  ephemeral  = false
  limits     = {
      "memory" = "128MB"
      "cpu" = 2
  }
  name       = "gateway"
  profiles   = [
      "openwrt",
  ]
  image      = lxd_cached_image.openwrt.fingerprint
  wait_for_network = true
}
