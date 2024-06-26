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

telemetry {
  collection_interval = "5s"
  disable_hostname = false
  prometheus_metrics = true
  publish_allocation_metrics = true
  publish_node_metrics = true
}

plugin "docker" {
  config {
    extra_labels = ["job_name", "job_id", "task_group_name", "task_name", "namespace", "node_name", "node_id"]
  }
}