source "proxmox-iso" "nomad-client-debian-12" {
  proxmox_url              = "https://${var.proxmox_host}/api2/json"
  username                 = var.proxmox_api_user
  password                 = var.proxmox_api_password
  insecure_skip_tls_verify = true
  node                     = var.proxmox_node

  vm_name                 = var.vm_name
  template_description    = "Debian 12 Packer Template (with Nomad) -- Created: ${formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}"
  vm_id                   = var.vmid
  os                      = "l26"
  cpu_type                = var.cpu_type
  sockets                 = "1"
  cores                   = var.cores
  memory                  = var.memory
  machine                 = "q35"
  bios                    = "seabios"
  scsi_controller         = "virtio-scsi-single"
  qemu_agent              = true
  cloud_init              = true
  cloud_init_storage_pool = var.storage_pool

  network_adapters {
    bridge   = "vmbr2"
    firewall = false
    model    = "virtio"
    vlan_tag = var.network_vlan
  }

  disks {
    disk_size         = var.disk_size
    format            = var.disk_format
    storage_pool      = var.storage_pool
    type              = "scsi"
  }

  iso_file         = var.iso_file
  iso_storage_pool = var.iso_storage_pool
  unmount_iso      = true

  http_directory = "http"
  http_port_min  = 8100
  http_port_max  = 8100
  boot_wait      = "10s"
  boot_command   = ["<esc><wait>auto url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<enter>"]

  ssh_username = "root"
  ssh_password = "packer"
  ssh_timeout  = "60m"
}

build {
  sources = ["source.proxmox-iso.nomad-client-debian-12"]

  # Copy scripts up to temp
  provisioner "file" {
    destination = "/tmp"
    source      = "./scripts"
  }

  # Execute the provisioner
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/scripts/provisioner.sh"]
  }

  # Copy configs into place
  provisioner "file" {
    destination = "/etc/cloud/cloud.cfg"
    source      = "./configs/cloud/cloud.cfg"
  }

  provisioner "file" {
    destination = "/etc/nomad.d/client.hcl"
    source      = "./configs/nomad/client.hcl"
  }

    provisioner "file" {
    destination = "/etc/consul.d/client.hcl"
    source      = "./configs/consul/client.hcl"
  }

    provisioner "file" {
    destination = "/etc/coredns/corefile"
    source      = "./configs/coredns/corefile"
  }

    provisioner "file" {
    destination = "/etc/systemd/system/coredns.service"
    source      = "./configs/coredns/coredns.service"
  }

  # Execute cleanup
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/scripts/cleanup.sh"]
  }

}