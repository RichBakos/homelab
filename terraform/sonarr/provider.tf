terraform {
  required_providers {
    sonarr    = {
      source  = "devopsarr/sonarr"
      version = "3.2.0"
    }
  }
}

provider "sonarr" {
  url     = var.url
  api_key = var.api_key
}