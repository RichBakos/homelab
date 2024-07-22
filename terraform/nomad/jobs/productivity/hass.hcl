job "hass" {
  type      = "service"
  namespace = "productivity"

  group "hass" {

    network {
      port "http" { static = "8123" }
    }

    volume "hass" {
      type    = "host"
      source  = "hass"
    }

    service {
      name = "hass"      
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.hass.entrypoints=websecure",	        
      ]        
      check {
        type      = "tcp"
        interval  = "10s"
        timeout   = "2s"
      }
    }

    task "hass" {
      driver = "docker"

      volume_mount {
        volume      = "hass"
        destination = "/config"
      }       
			
      config {
        image         = "homeassistant/home-assistant:latest"
        ports         = ["http"]
        network_mode  = "host"        
        # volumes       = [            
        #   "local/automations.yaml:/config/automations.yaml",
        #   "local/configuration.yaml:/config/configuration.yaml",
        #   "local/covers.yaml:/config/covers.yaml",
        #   "local/customize.yaml:/config/customize.yaml",
        #   "local/lights.yaml:/config/lights.yaml",      
        # ]        
      }

      resources {
        cpu     = 1000
        memory  = 1024
      }

#       template {
#         destination = "local/automations.yaml"
#         data        = <<EOF
# {{- key "homelab/hass/automations.yaml" }}
# EOF
#       }

#       template {
#         destination = "local/configuration.yaml"
#         data        = <<EOF
# {{- key "homelab/hass/configuration.yaml" }}
# EOF
#       }

#       template {
#         destination = "local/covers.yaml"
#         data        = <<EOF
# {{- key "homelab/hass/covers.yaml" }}
# EOF
#       }

#       template {
#         destination = "local/customize.yaml"
#         data        = <<EOF
# {{- key "homelab/hass/customize.yaml" }}
# EOF
#       }

#       template {
#         destination = "local/lights.yaml"
#         data        = <<EOF
# {{- key "homelab/hass/lights.yaml" }}
# EOF
#       }                 
    }
  }
}
