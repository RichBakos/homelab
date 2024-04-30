server             = true
client_addr        = "0.0.0.0"
advertise_addr 		 = "{{GetInterfaceIP \"eth0\"}}"
bind_addr 				 = "{{GetInterfaceIP \"eth0\"}}"
data_dir           = "/opt/consul"
datacenter         = "dc1"
enable_syslog			 = true
leave_on_terminate = true
log_level					 = "WARN"
retry_join         = ["clarkson.bakos.lan","logan.bakos.lan","speer.bakos.lan"]
ui_config {
  enabled = true
}
telemetry {
  prometheus_retention_time = "60s"
}