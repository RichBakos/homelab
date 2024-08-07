job "transmission" {
  type      = "service"
  namespace = "media"

  group "transmission" {

    network {
      port "http" { static = 9091 }
    }

    volume transmission {
      type   = "host"
      source = "transmission"
    }

    volume media {
      type   = "host"
      source = "media"
    }

    service {
      name = "transmission"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.transmission.entrypoints=websecure",
        "traefik.http.routers.transmission.middlewares=auth",
      ]
      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "transmission" {
      driver = "docker"

      config {
        image        = "lscr.io/linuxserver/transmission:4.0.6"
        ports        = ["http"]
        network_mode = "host"
        volumes = [
          "watch/:/data/downloads/watch"
        ]
      }

      volume_mount {
        volume      = "transmission"
        destination = "/config"
      }

      volume_mount {
        volume      = "media"
        destination = "/data"
      }

      env {
        PUID = 1010
        PGID = 1010
        TZ   = "America/Denver"
      }

      resources {
        cpu    = 500
        memory = 512
      }
    }
  }
}