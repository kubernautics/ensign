resource "lxd_cached_image" "openwrt" {
  source_remote = "lxd-server-1"
  source_image  = "openwrt/19.07.2/x86_64"
}
#resource "lxd_cached_image" "ubuntu2004" {
#  source_remote = "ubuntu"
#  source_image = "20.04"
#}
