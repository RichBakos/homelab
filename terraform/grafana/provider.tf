terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "3.3.0"
    }
  }
}

provider "grafana" {
  url  = "gf_url"
  auth = "${var.grafana_email}:${var.grafana_password}"
}