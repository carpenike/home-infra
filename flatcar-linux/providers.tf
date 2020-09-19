provider "matchbox" {
  endpoint    = "matchbox.holthome.net:8071"
  client_cert = file("~/.matchbox/client.crt")
  client_key  = file("~/.matchbox/client.key")
  ca          = file("~/.matchbox/ca.crt")
}

provider "ct" {}

terraform {
  required_providers {
    ct = {
      source  = "poseidon/ct"
      version = "0.6.1"
    }
    matchbox = {
      source = "poseidon/matchbox"
      version = "0.4.1"
    }
  }
}
