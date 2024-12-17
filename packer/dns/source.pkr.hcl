source "proxmox-clone" "dns" {

  proxmox_url          = var.proxmox_url
  username             = var.proxmox_user
  password             = var.proxmox_password

  vm_id                = 9001
  vm_name              = "dns-tpl"
  template_description = "CoreDNS template"

  clone_vm    = "base-tpl"
  full_clone  = true
  node        = var.proxmox_node
  
  os      = "l26"
  sockets = 1
  cores   = 1
  memory  = 1024
  
  network_adapters {
    bridge   = "vmbr2"
    vlan_tag = 20
    model    = "virtio"
  }

  cloud_init              = true
  cloud_init_storage_pool = "rbd"

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  
}