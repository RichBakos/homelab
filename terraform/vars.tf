###--- Terraform vars ---###

variable "nomad_url" {
  type        = string
  description = "The URL of the Nomad server"
}

variable "consul_url" {
  type        = string
  description = "The URL of the Consul server"
}

variable "consul_token" {
  type        = string
  description = "The URL of the Consul server"
}

###--- Auth vars ---###

variable "auth_domain" {
  type        = string
  description = "The domain of the homelab"
}

variable "auth_client_id" {
  type        = string
  description = "The client ID ofr hte forwardAuth plugin for Traefik"
}

variable "auth_client_secret" {
  type        = string
  description = "The client secret for the forwardAuth plgin for Traefik"
}

variable "auth_secret" {
  type        = string
  description = "The secret for teh forwardAuth plugin for Traefik"
}

variable "auth_whitelist_email" {
  type        = string
  description = "The email to be whitelisted by the forwardAuth plugin"
}

###--- Grafana vars ---###

variable "gf_security_admin_user" {
  type        = string
  description = "The username of the grafana admin"
}

variable "gf_security_admin_password" {
  type        = string
  description = "The password used by the grafana admin"
}

###--- Traefik vars ---###

variable "cf_api_email" {
  type        = string
  description = "The email for the cloudflare account"
}

variable "cf_api_key" {
  type        = string
  description = "The API key for the cloudflare account"
}

variable "postgres_root_user" {
  type        = string
  description = "The root user for postgres"
}

variable "postgres_root_password" {
  type        = string
  description = "The password for the Postgres root user"
}

###--- Influxdb vars ---###

variable "influxdb_password" {
  type        = string
  description = "The password for the Postgres root user"
}

variable "influxdb_user" {
  type        = string
  description = "The root user for postgres"
}

###--- Samba vars ---###

variable "samba_password" {
  type        = string
  description = "The password for samba"
}

variable "samba_share" {
  type        = string
  description = "The samba share"
}

variable "samba_uid" {
  type        = string
  description = "The UID for the samba user"
}

###--- Unifi vars ---###

variable "mongo_pass" {
  type        = string
  description = "The mongo password for the Unifi db"
}

variable "mongo_user" {
  type        = string
  description = "The mongo user for the unifi db"
}
