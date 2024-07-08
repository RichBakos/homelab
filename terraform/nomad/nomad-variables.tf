resource "nomad_variable" "auth" {
  namespace = nomad_namespace.security.name
  path      = "nomad/jobs/auth"
  items = {
    AUTH_HOST                       = "auth.${var.auth_domain}"
    COOKIE_DOMAIN                   = var.auth_domain
    INSECURE_COOKIE                 = "true"
    LOG_LEVEL                       = "WARN"
		PROVIDERS_GOOGLE_CLIENT_ID      = var.auth_client_id
		PROVIDERS_GOOGLE_CLIENT_SECRET  = var.auth_client_secret
		SECRET                          = var.auth_secret
    WHITELIST                       = var.auth_whitelist_email
  }
}

resource "nomad_variable" "grafana" {
  namespace = nomad_namespace.observability.name  
  path      = "nomad/jobs/grafana"
  items = {
		GF_PATHS_DATA 							= "/var/lib/grafana"
		GF_SECURITY_ADMIN_USER 		 	= var.gf_security_admin_user
		GF_SECURITY_ADMIN_PASSWORD 	= var.gf_security_admin_password
		GF_INSTALL_PLUGINS 					= "grafana-piechart-panel"
  }
}

resource "nomad_variable" "influxdb" {
  namespace = nomad_namespace.storage.name  
  path      = "nomad/jobs/influxdb"
  items = {
  	DOCKER_INFLUXDB_INIT_BUCKET		= "default"
   	DOCKER_INFLUXDB_INIT_MODE     = "setup"
   	DOCKER_INFLUXDB_INIT_ORG      = "home"
   	DOCKER_INFLUXDB_INIT_PASSWORD = var.influxdb_password  
		DOCKER_INFLUXDB_INIT_USERNAME = var.influxdb_user

  }
}

resource "nomad_variable" "postgres" {
  namespace = nomad_namespace.storage.name  
	path      = "nomad/jobs/postgres"
	items = {
		POSTGRES_DB				= "postgres"
		POSTGRES_USER 		= var.postgres_root_user
		POSTGRES_PASSWORD = var.postgres_root_password
		PGDATA 						= "/var/lib/pgsql/data"
	}
}

resource "nomad_variable" "samba" {
  namespace = nomad_namespace.networking.name  
  path      = "nomad/jobs/samba"
  items = {
		SAMBA_SHARE 		= var.samba_share
		SAMBA_UID 			= var.samba_uid
		samba_password	= var.samba_password
  }
}

resource "nomad_variable" "unifi" {
  namespace = nomad_namespace.networking.name  
  path      = "nomad/jobs/unifi"
  items = {
		MONGO_DBNAME	= "unifi" 
		MONGO_HOST		= "mongo.service.consul"
		MONGO_PASS		= var.mongo_pass
		MONGO_PORT		= "27017"
		MONGO_USER		= var.mongo_user
  }
}
