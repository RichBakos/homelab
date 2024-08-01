bind_addr   = "0.0.0.0"
data_dir    = "/opt/nomad/"
datacenter  = "dc1"
region      = "home"
log_level   = "warn"

server {
  enabled = true
  bootstrap_expect = 3
  heartbeat_grace = "300s"
  min_heartbeat_ttl = "20s"
}

advertise {
  http = "{{GetInterfaceIP \"np6s18\"}}:4646"
  rpc = "{{GetInterfaceIP \"np6s18\"}}:4647"
  serf = "{{GetInterfaceIP \"np6s18\"}}:4648"
}

consul {
  address = "127.0.0.1:8500"
  auto_advertise = true
  server_auto_join = true
  client_auto_join = true
}