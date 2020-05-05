# provider to connect to infrastructure
provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true
  lxd_remote {
    name     = "lxd-server-1"
    scheme   = "https"
    address  = "ensign.ministack.dev"
    password = "blablabla"
    default  = true
  }
}
