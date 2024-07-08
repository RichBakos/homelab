resource "sonarr_host" "sonarr" {
  launch_browser  = true
  port            = 8989
  url_base        = ""
  bind_address    = "*"
  application_url = ""
  instance_name   = "Sonarr"
  proxy = {
    enabled = false
  }
  ssl = {
    enabled                = false
    certificate_validation = "enabled"
  }
  logging = {
    log_level = "info"
  }
  backup = {
    folder    = "/backup"
    interval  = 5
    retention = 10
  }
  authentication = {
    method   = "none"
    required = "disabledForLocalAddresses"
  }
  update = {
    mechanism = "docker"
    branch    = "master"
  }
}

resource "sonarr_download_client_transmission" "example" {
  enable    = true
  priority  = 1
  name      = "Transmission"
  host      = "transmission.service.consul"
  url_base  = "/transmission/" 
  port      = 9091
}

# data "sonarr_remote_path_mapping" "mapping" {
#   id          = 1
#   remote_path = "/downloads/complete/"
#   local_path  = "/data/downloads/complete/"
# }