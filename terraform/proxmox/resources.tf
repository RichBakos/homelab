This is what I've done on my PVE Cluster:

terraform.tfvars:

proxmox_cluster_nodes = ["PVE-001", "PVE-002", "PVE-003", "PVE-004"]

vm.tf:

resource "proxmox_virtual_environment_vm" "debian_vm" {

count = var.cluster_count

description = "DEB-${format("%03d", count.index)}"

name = "DEB-${format("%03d", count.index)}"

node_name = var.proxmox_cluster_nodes[count.index % length(var.proxmox_cluster_nodes)]

machine = "q35"

bios = "seabios"

vm_id = 3000 + count.index

you'll want this in the resource too, they'll move:

lifecycle {

ignore_changes = [

node_name

]

}