terraform {
  backend "consul" {
    address = "clarkson.bakos.lan:8500"
    scheme  = "http"
    path    = "homelab/terraform"
  }
}

module "nomad" {
  source                      = "./nomad"
  address                     = var.nomad_url
  auth_domain                 = var.auth_domain
  auth_client_id              = var.auth_client_id 
  auth_client_secret          = var.auth_client_secret 
  auth_secret                 = var.auth_secret 
  auth_whitelist_email        = var.auth_whitelist_email 
  gf_security_admin_user      = var.gf_security_admin_user
  gf_security_admin_password  = var.gf_security_admin_password
  samba_password              = var.samba_password
  samba_share                 = var.samba_share 
  samba_uid                   = var.samba_uid  
  cf_api_email                = var.cf_api_email  
  cf_api_key                  = var.cf_api_key  
  mongo_user                  = var.mongo_user  
  mongo_pass                  = var.mongo_pass 
  influxdb_user               = var.influxdb_user
  influxdb_password           = var.influxdb_password
  postgres_root_user          = var.postgres_root_user
  postgres_root_password      = var.postgres_root_password  
}

module "consul" {
  source  = "./consul"
  consul_address = var.consul_url
  consul_token = var.consul_token

}


