# resource "prowlarr_host" "prowlarr" {
#   launch_browser  = true
#   port            = 9696
#   url_base        = ""
#   bind_address    = "*"
#   application_url = ""
#   instance_name   = "Prowlarr"
#   proxy = {
#     enabled = false
#   }
#   ssl = {
#     enabled                = false
#     certificate_validation = "enabled"
#   }
#   logging = {
#     log_level = "info"
#   }
#   backup = {
#     folder    = "/backup"
#     interval  = 5
#     retention = 10
#   }
#   authentication = {
#     method   = "none"
#     required = "disabledForLocalAddresses"
#   }
#   update = {
#     mechanism = "docker"
#     branch    = "master"
#   }
# }

resource "prowlarr_application_radarr" "radarr" {
  name = "Radarr"
  sync_level = "fullSync"
  base_url = "http://radarr.service.consul:7878"
  prowlarr_url = "http://prowlarr.service.consul:9696"
  api_key = "167390ac0e444bb885a1b1e2600d9886"
}

resource "prowlarr_application_sonarr" "sonarr" {
  name = "Sonarr"
  sync_level = "fullSync"
  base_url = "http://sonarr.service.consul:8989"
  prowlarr_url = "http://prowlarr.service.consul:9696"
  api_key = "5ee2e2925e284729b034f973f1141458"
}