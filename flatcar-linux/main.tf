module "k8s" {
  #source = "git::https://github.com/carpenike/typhoon//bare-metal/container-linux/kubernetes?ref=per-node-install-disk"
  source = "git::https://github.com/poseidon/typhoon//bare-metal/fedora-coreos/kubernetes?ref=v1.19.2"
  # bare-metal
  cluster_name            = "k8s"
  matchbox_http_endpoint  = "http://matchbox.holthome.net:8070"
  os_channel              = "stable"
  os_version              = "32.20200824.3.0"

  # configuration
  k8s_domain_name    = "k8s.holthome.net"
  ssh_authorized_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC598M/7+HdUT6J1plbqAZ+2P78Y1bQF+sHQ9MQEYQVG2B2P2vTKKZlRxm6PE8smFzwTawHPNY/x/9B0Q5YkYBQS+yyo3ICFUMpjS0IBc1uEszl3MmMmpCWDq6MiySFZAKxwnYLNIJv82YywqD+Gyo0U5sQpUWQ1OR2qZaFaOaPLwuOFxr6/uVxnUEVxNSUflLx8SR4YlfdwQdgpq8LTt5PMi+FNRLYNgJ89g4g6GkpCcXNS2auZDq93B2YwKwPxm5UjbJh8WkCbAzYxYiGHuel01Ll1uqAH4zu7rw5G0vsDhudY51AmRicK8vNMvvAtrTxEqeZwE1K6VQ7BvsuApvkC58qYm8s02llLvTvoTM1HRyGLVqIFKE8M0Vpz01wa/ss2L0rFntmC/asph1unJQMFg+eB1L85Ppa4z0q9lYV0iuyQZgTs0XISDyQqr7l1nv1JxgMSSUlAomemchH733gYM64xalNzK8OMG73ku9EWIpEFr87OcjYYtrcjtRNWLaxRZ/cpTrd1H4B3S/nL9/VtrNSSvo9gdacRm6bBVepIBsD7v7Lo5DxP2iW6JaGgstQttbGtwnYAoqf0pyA3PWeKjKBzrw+X7DMAXNDVpNia3yscSmkJ2JE+sS/3d6S1ESbxuxUq6ojNp+rL9YFd9v5yZNZ4UqMGjwoR3DrRfSOyQ=="

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
