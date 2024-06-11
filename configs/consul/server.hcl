server             = true
ui                 = true
client_addr        = "0.0.0.0"
<<<<<<< HEAD
advertise_addr     = ""
bind_addr          = "{{GetInterfaceIP \"eth0\"}}"
=======
advertise_addr		 = ""
bind_addr					 = "{{GetInterfaceIP \"eth0\"}}"
>>>>>>> 3b4b786 (Server.hcl edits)
bootstrap_expect   = 3
data_dir           = "/opt/consul"
datacenter         = "dc1"
enable_syslog      = true
log_level          = "warn"
retry_join         = ["clarkson.bakos.lan","logan.bakos.lan","speer.bakos.lan"]
