output "public_ipv4" {
  value = lxd_container.gateway.ip_address
}
