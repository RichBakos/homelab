client {

  host_volume "bitwarden" {
    path      = "/mnt/data/volumes/bitwarden"
    read_only = false
  }

	host_volume "cannery" {
    path      = "/mnt/data/volumes/cannery"
    read_only = false
  }

  host_volume "flaresolverr" {
    path      = "/mnt/data/volumes/flaresolverr"
    read_only = false
  }	

  host_volume "hass" {
    path      = "/mnt/data/volumes/hass"
    read_only = false
  }

  host_volume "grafana" {
    path      = "/mnt/data/volumes/grafana"
    read_only = false
  }	

  host_volume "influxdb-config" {
    path      = "/mnt/data/volumes/influxdb/config"
    read_only = false
  }	

  host_volume "influxdb-data" {
    path      = "/mnt/data/volumes/influxdb/data"
    read_only = false
  }	

  host_volume "loki" {
    path      = "/mnt/data/volumes/loki"
    read_only = false
  }	

	host_volume "media" {
    path      = "/mnt/data/media"
    read_only = false
  }

  host_volume "mongo" {
    path      = "/mnt/data/volumes/mongo"
    read_only = false
  }	

  host_volume "mass" {
    path      = "/mnt/data/volumes/mass"
    read_only = false
  }	

  host_volume "plex" {
    path      = "/mnt/data/volumes/plex"
    read_only = false
  }

  host_volume "postgres" {
    path      = "/mnt/data/volumes/postgres"
    read_only = false
  }	

  host_volume "prometheus" {
    path      = "/mnt/data/volumes/prometheus"
    read_only = false
  }

  host_volume "prowlarr" {
    path      = "/mnt/data/volumes/prowlarr"
    read_only = false
  }

  host_volume "radarr" {
    path      = "/mnt/data/volumes/radarr"
    read_only = false
  }

  host_volume "sabnzbd" {
    path      = "/mnt/data/volumes/sabnzbd"
    read_only = false
  }	

  host_volume "sonarr" {
    path      = "/mnt/data/volumes/sonarr"
    read_only = false
  }

  host_volume "traefik_certs" {
    path      = "/mnt/data/volumes/traefik_certs"
    read_only = false
  }

  host_volume "transmission" {
    path      = "/mnt/data/volumes/transmission"
    read_only = false
  }	

  host_volume "unifi" {
    path      = "/mnt/data/volumes/unifi"
    read_only = false
  }	

  host_volume "vector" {
    path      = "/mnt/data/volumes/vector"
    read_only = false
  }	

  host_volume "wikijs" {
    path      = "/mnt/data/volumes/wikijs"
    read_only = false
  }	

}