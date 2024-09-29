build {
  sources = ["source.proxmox-iso.nomad-client"]

  # Copy volumes up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "../../storage"
  }  

  # Copy config up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "../configs"
  }

  # Copy provisioner up to tmp
  provisioner "file" {
    destination = "/tmp"
    source      = "./scripts"
  }

  # Provision
  provisioner "shell" {
    inline_shebang  = "/bin/bash -e"
    inline          = ["/bin/bash /tmp/scripts/provision.sh"]
  }
 
}