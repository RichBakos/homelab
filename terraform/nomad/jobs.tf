resource "nomad_job" "coredns" {
  jobspec = file("${path.module}/jobs/networking/coredns.hcl")
}

resource "nomad_job" "keepalived" {
  jobspec = file("${path.module}/jobs/networking/keepalived.hcl")
}

resource "nomad_job" "auth" {
  jobspec = file("${path.module}/jobs/security/auth.hcl")
}

resource "nomad_job" "bitwarden" {
  jobspec = file("${path.module}/jobs/security/bitwarden.hcl")
}

resource "nomad_job" "traefik" {
  jobspec = file("${path.module}/jobs/networking/traefik.hcl")
}

resource "nomad_job" "drawio" {
  jobspec = file("${path.module}/jobs/productivity/drawio.hcl")
}

resource "nomad_job" "flaresolverr" {
  jobspec = file("${path.module}/jobs/media/flaresolverr.hcl")
}

resource "nomad_job" "grafana" {
  jobspec = file("${path.module}/jobs/observability/grafana.hcl")
}

resource "nomad_job" "hass" {
  jobspec = file("${path.module}/jobs/productivity/hass.hcl")
}

resource "nomad_job" "influxdb" {
  jobspec = file("${path.module}/jobs/storage/influxdb.hcl")
}

resource "nomad_job" "jellyfin" {
  jobspec = file("${path.module}/jobs/media/jellyfin.hcl")
}

resource "nomad_job" "loki" {
  jobspec = file("${path.module}/jobs/observability/loki.hcl")
}

resource "nomad_job" "mongo" {
  jobspec = file("${path.module}/jobs/storage/mongo.hcl")
}

resource "nomad_job" "mass" {
  jobspec = file("${path.module}/jobs/media/mass.hcl")
}

resource "nomad_job" "pgweb" {
  jobspec = file("${path.module}/jobs/productivity/pgweb.hcl")
}

resource "nomad_job" "plex" {
  jobspec = file("${path.module}/jobs/media/plex.hcl")
}

resource "nomad_job" "postgres" {
  jobspec = file("${path.module}/jobs/storage/postgres.hcl")
}

resource "nomad_job" "prowlarr" {
  jobspec = file("${path.module}/jobs/media/prowlarr.hcl")
}

resource "nomad_job" "radarr" {
  jobspec = file("${path.module}/jobs/media/radarr.hcl")
}

resource "nomad_job" "sabnzbd" {
  jobspec = file("${path.module}/jobs/media/sabnzbd.hcl")
}

resource "nomad_job" "sonarr" {
  jobspec = file("${path.module}/jobs/media/sonarr.hcl")
}

resource "nomad_job" "transmission" {
  jobspec = file("${path.module}/jobs/media/transmission.hcl")
}

resource "nomad_job" "unifi" {
  jobspec = file("${path.module}/jobs/networking/unifi.hcl")
  depends_on = [ nomad_job.unifi ]
}

# resource "nomad_job" "vector" {
#   jobspec = file("${path.module}/jobs/observability/vector.hcl")
#   depends_on = [ nomad_job.loki ]
# }

resource "nomad_job" "wikijs" {
  jobspec = file("${path.module}/jobs/productivity/wikijs.hcl")
}

resource "nomad_job" "docker_cleanup" {
  jobspec = file("${path.module}/jobs/maintenance/docker-cleanup.hcl")
}

resource "nomad_job" "journalctl_cleanup" {
  jobspec = file("${path.module}/jobs/maintenance/journalctl-cleanup.hcl")
}

resource "nomad_job" "nomad_cleanup" {
  jobspec = file("${path.module}/jobs/maintenance/nomad-cleanup.hcl")
}