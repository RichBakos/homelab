variable "proxmox_api_user" {
  type = string
  default = env("proxmox_api_user")
}

variable "proxmox_api_password" {
  type = string
  sensitive = true  
  default = env("proxmox_api_password")
}

source "proxmox-iso" "debian12-nomad-server" {
  proxmox_url              = "https://172.16.20.201:8006/api2/json"
  username                 = var.proxmox_api_user
  password                 = var.proxmox_api_password
  insecure_skip_tls_verify = true
  node                     = "pmx201"

  vm_id                   = "9002"
  vm_name                 = "debian12-nomad-server"
  template_description    = "Debian 12 Template-- Created: ${formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())}"
  os                      = "l26"
  cpu_type                = "host"
  sockets                 = "1"
  cores                   = "2"
  memory                  = "2048"
  machine                 = "q35"
  bios                    = "seabios"
  scsi_controller         = "virtio-scsi-single"
  qemu_agent              = true
  cloud_init              = true
  cloud_init_storage_pool = "guests"

  network_adapters {
    bridge   = "vmbr2"
    firewall = false
    model    = "virtio"
    vlan_tag = "30"
  }

  disks {
    disk_size         = "16G"
    format            = "raw"
    storage_pool      = "guests"
    type              = "scsi"
  }

  iso_file         = "local:iso/debian-12.6.0-amd64-netinst.iso"
  iso_storage_pool = "local"
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
  sources = ["source.proxmox-iso.debian12-nomad-server"]

  # Copy scripts up to temp
  provisioner "file" {
    destination = "/tmp"
    source      = "./scripts"
  }

  # Copy configs up to temp
  provisioner "file" {
    destination = "/tmp"
    source      = "./configs"
  }

  # Execute the provisioner
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/scripts/provisioner.sh"]
  }
}