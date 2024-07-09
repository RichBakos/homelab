# resource "radarr_host" "radarr" {
#   launch_browser  = true
#   port            = 7878
#   url_base        = ""
#   bind_address    = "*"
#   application_url = ""
#   instance_name   = "Radarr"
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
#     method   = "forms"
#     required = "disabledForLocalAddresses"
#   }
#   update = {
#     mechanism = "docker"
#     branch    = "master"
#   }
# }

resource "radarr_download_client_transmission" "example" {
  enable = true
  priority = 1
  name = "Transmission"
  host = "transmission.service.consul"
  url_base = "/transmission/" 
  port = 9091
}

# data "radarr_remote_path_mapping" "mapping" {
#   id          = 1
#   remote_path = "/downloads/complete/"
#   local_path  = "/data/downloads/complete/"
# }

resource "radarr_notification_plex" "plex" {
  on_download = true
  on_upgrade = true
  on_rename = false
  on_movie_added = false
  on_movie_delete	= false
  on_movie_file_delete = false
  on_movie_file_delete_for_upgrade = true
  include_health_warnings	= false
  name = "Plex Media Server"
  host = "plex.service.consul"
  port = 32400
  auth_token = var.auth_token
}