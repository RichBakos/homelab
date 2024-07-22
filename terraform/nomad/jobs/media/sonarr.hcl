job "sonarr" {
  type      = "service"
  namespace = "media"

  group "sonarr" {

    network {
      port "http" { static = "8989" }
    }	 

    volume sonarr {
      type    = "host"
      source  = "sonarr" 
    }

    volume media {
      type = "host"
      source = "media"
    }

    service {
      name = "sonarr"
      port = "http"
      tags = [
        "traefik.enable=true", 
        "traefik.http.routers.sonarr.entrypoints=websecure",                       			        
        "traefik.http.routers.sonarr.middlewares=auth",
      ]
      
      check {
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "2s"
      }
    }

    task "sonarr" {
      driver = "docker"   

      config {
        image = "linuxserver/sonarr"
        ports = ["http"]
        network_mode = "host"
      }	 

      volume_mount {
        volume = "sonarr"
        destination = "/config"
      }       

      volume_mount {
        volume = "media"
        destination = "/data"
      }             

      env {
        PUID=1010
        PGID=1010
        TZ="America/Denver"        
      } 

      resources {
        cpu    = 1000
        memory = 1024
      }                    
    }
  }
}