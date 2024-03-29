bind_addr = "0.0.0.0"
data_dir = "/opt/nomad/"
datacenter = "dc1"
region = "home"
log_level = "warn"


client {
  enabled = true

  options = {
    docker.privileged.enabled = true
    docker.volumes.enabled = true
    docker.caps.whitelist = "ALL"
    driver.raw_exec.enable = "1"
  }

}

consul {
  address = "127.0.0.1:8500"
  client_service_name = "nomad-client"
  auto_advertise = true
  server_auto_join = true
  client_auto_join = true
}
