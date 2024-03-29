server         = false
client_addr    = "0.0.0.0"
advertise_addr = ""
bind_addr      = "{{GetInterfaceIP \"eth0\"}}"
data_dir       = "/opt/consul"
datacenter     = "dc1"
enable_syslog  = true
log_level      = "WARN