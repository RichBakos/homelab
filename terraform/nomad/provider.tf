terraform {
  required_providers {
    nomad = {
      source  = "hashicorp/nomad"
      version = "2.3.0"
    }
  }
}

provider "nomad" {
  address = var.address
}