terraform {
  required_providers {
    prowlarr = {
      source = "devopsarr/prowlarr"
      version = "2.4.0"
    }
  }
}

provider "prowlarr" {
  url     = var.url
  api_key = var.api_key
}