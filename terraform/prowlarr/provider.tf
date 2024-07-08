<<<<<<< HEAD
=======
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
}terraform {
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
>>>>>>> 8ecf46d (Added that following providers: Grafana, Prowlarr, Radarr and Sonarr)
