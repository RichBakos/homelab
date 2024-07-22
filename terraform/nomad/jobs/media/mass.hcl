job "mass" {
  type      = "service"
  namespace = "media"

  group "mass" {

    network {
      port "http" { static = "8095" }
    }		 

    volume mass {
      type    = "host"
      source  = "mass" 
    }

    service {
      name = "mass"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.mass.entrypoints=websecure", 
        "traefik.http.routers.mass.middlewares=auth"
      ]

      check {
        type     = "tcp"
        interval = "10s"
        timeout  = "30s"
      }
    }

    task "mass" {
      driver = "docker"

      config {
        image 	= "ghcr.io/music-assistant/server"
        network_mode = "host"
        ports 	= ["http"]
      }

      volume_mount {
        volume = "mass"
        destination = "/data"
      }  

      resources {
        cpu    = 500
        memory = 512
      }         
    }
  }
}