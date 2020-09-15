// Create a flatcar-install profile
resource "matchbox_profile" "flatcar-install" {
  name   = "flatcar-install"
  kernel = "/assets/flatcar/2605.3.0/flatcar_production_pxe.vmlinuz"

  initrd = [
    "/assets/flatcar/2605.3.0/flatcar_production_pxe_image.cpio.gz",
  ]

  args = [
    "initrd=flatcar_production_pxe_image.cpio.gz",
    "coreos.config.url=${var.matchbox_http_endpoint}/ignition?uuid=$${uuid}&mac=$${mac:hexhyp}",
    "coreos.first_boot=yes",
    "console=tty0",
    "console=ttyS0",
  ]

  container_linux_config = file("./cl/flatcar-install.yaml.tmpl")
}

// Create a simple profile which just sets an SSH authorized_key
resource "matchbox_profile" "simple" {
  name                   = "simple"
  container_linux_config = file("./cl/simple.yaml.tmpl")
}
