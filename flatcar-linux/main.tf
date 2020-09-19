module "k8s" {
  source = "git::https://github.com/carpenike/typhoon//bare-metal/container-linux/kubernetes?ref=per-node-install-disk"

  # bare-metal
  cluster_name            = "k8s"
  matchbox_http_endpoint  = "http://matchbox.holthome.net:8070"
  os_channel              = "stable"
  os_version              = "32.20200824.3.0"

  # configuration
  k8s_domain_name    = "k8s.holthome.net"
  ssh_authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDgWHeNLYHvFUf2XJnjgQ0jA+ZfcqY3JTQcEApTXl7lf1TagWvckoy57uA2Uifk5xct9G/IjoASWYy702yB8m6AWvYhdKBQ4wSnJRi587cuWYVUYLYns2qbEqejLIrKwo6SzSD3m3sg2xb0kpJQr1lA14WKhCnHQ7FSCmuNr3APbWeD7EvPfmwYcddVUVY6zbyjA8C04esSOWiekJTNKicKtolycrJZVgSCKaG68OeK7YioPiGCi7mbGteLSmoAsIrK/q18IUiY0aLgfuUINdO0FpfWcVkxjzdbPY1xWIcRDg4Tb4rfZjoTycVpnj8pwmpvfmspRcTpx7LgyLO8cwl"

  # machines
  controllers = [{
    name   = "h2-0"
    mac    = "00:1e:06:45:2e:bc"
    domain = "h2-0.holthome.net"
    install_disk = "/dev/nvme0n1"
  }]
  workers = [
    {
      name   = "r610-0",
      mac    = "d4:be:d9:f5:16:59"
      domain = "r610-0.holthome.net"
      install_disk = "/dev/sda"
    },
    {
      name   = "r610-1",
      mac    = "00:21:9b:90:75:39"
      domain = "r610-1.holthome.net"
      install_disk = "/dev/sda"
    },
    {
      name   = "r610-2",
      mac    = "00:21:9b:9e:c4:5f"
      domain = "r610-2.holthome.net"
      install_disk = "/dev/sda"
    }
  ]

  # set to http only if you cannot chainload to iPXE firmware with https support
  # download_protocol = "http"
  cached_install = "true"
  networking = "cilium"
  pod_cidr = "10.42.0.0/16"
  service_cidr = "10.43.0.0/16"

}
