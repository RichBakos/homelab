server         = false
client_addr    = "0.0.0.0"
bind_addr      = "{{GetInterfaceIP \"eth0\"}}"
data_dir       = "/opt/consul"
datacenter     = "dc1"
log_level      = "warn"
retry_join     = ["clarkson.bakos.lan","logan.bakos.lan","speer.bakos.lan"]
