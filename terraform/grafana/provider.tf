terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.3.0"
    }
  }
}

provider "grafana" {
  url  = var.url
  auth = "${var.email}:${var.password}"
}
