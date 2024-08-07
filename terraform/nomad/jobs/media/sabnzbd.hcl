job "sabnzbd" {
  type      = "service"
  namespace = "media"

  group "sabnzbd" {

    network {
      port "http" { to = "8080" }
    }

    volume sabnzbd {
      type   = "host"
      source = "sabnzbd"
    }

    volume media {
      type   = "host"
      source = "media"
    }

    service {
      port = "http"
      name = "sabnzbd"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.sabnzbd.entrypoints=websecure",
        "traefik.http.routers.sabnzbd.middlewares=auth"
      ]

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "sabnzbd" {
      driver = "docker"

      config {
        image        = "lscr.io/linuxserver/sabnzbd:4.3.2"
        ports        = ["http"]
        network_mode = "host"
      }

      volume_mount {
        volume      = "sabnzbd"
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
