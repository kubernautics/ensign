provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true
  lxd_remote {
    name     = "ensign"
    scheme   = "https"
    default  = true
    password = "blablabla"
    address = "ensign.ministack.dev"
  }
  lxd_remote {
    name = "lxd-server-1"
    scheme = "https"
    address = "ensign.ministack.dev"
    password = "blablabla"
  }
}
