job "radarr" {
  type      = "service"
  namespace = "media"

  group "radarr" {

    network {
      port "http" { static = "7878" }
    }

    volume "radarr" {
      type   = "host"
      source = "radarr"
    }

    volume "media" {
      type   = "host"
      source = "media"
    }

    service {
      name = "radarr"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.radarr.entrypoints=websecure",
        "traefik.http.routers.radarr.middlewares=auth"
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "radarr" {
      driver = "docker"

      config {
        image        = "lscr.io/linuxserver/radarr:5.8.3"
        ports        = ["http"]
        network_mode = "host"
      }

      volume_mount {
        volume      = "radarr"
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
        cpu    = 1000
        memory = 1024
      }
    }
  }
}