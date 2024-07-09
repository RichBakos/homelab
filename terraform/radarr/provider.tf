terraform {
  required_providers {
    radarr = {
      source = "devopsarr/radarr"
      version = "2.2.0"
    }
  }
}

provider "radarr" {
  url = var.url
  api_key = var.api_key
}
