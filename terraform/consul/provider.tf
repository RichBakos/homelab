terraform {
  required_providers {
    consul = {
      source  = "hashicorp/consul"
      version = "2.20.0"
    }
  }
}

provider "consul" {
  address = var.consul_address
}