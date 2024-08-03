job "hass" {
  type      = "service"
  namespace = "productivity"

  group "hass" {

    network {
      port "http" { static = "8123" }
    }

    volume "hass" {
      type   = "host"
      source = "hass"
    }

    service {
      name = "hass"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.hass.entrypoints=websecure",
      ]
      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "hass" {
      driver = "docker"

      volume_mount {
        volume      = "hass"
        destination = "/config"
      }

      config {
        image        = "homeassistant/home-assistant:2024.7"
        ports        = ["http"]
        network_mode = "host"
      }

      resources {
        cpu    = 1000
        memory = 1024
      }
    }
  }
}
