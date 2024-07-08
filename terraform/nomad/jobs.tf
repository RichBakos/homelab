resource "nomad_job" "coredns" {
  jobspec = file("${path.module}/jobs/networking/coredns.job")
}

resource "nomad_job" "keepalived" {
  jobspec = file("${path.module}/jobs/networking/keepalived.job")
}

resource "nomad_job" "auth" {
  jobspec = file("${path.module}/jobs/security/auth.job")
}

resource "nomad_job" "bitwarden" {
  jobspec = file("${path.module}/jobs/security/bitwarden.job")
}

resource "nomad_job" "traefik" {
  jobspec = file("${path.module}/jobs/networking/traefik.job")
}

resource "nomad_job" "drawio" {
  jobspec = file("${path.module}/jobs/productivity/drawio.job")
}

resource "nomad_job" "flaresolverr" {
  jobspec = file("${path.module}/jobs/media/flaresolverr.job")
}

resource "nomad_job" "grafana" {
  jobspec = file("${path.module}/jobs/observability/grafana.job")
}

resource "nomad_job" "hass" {
  jobspec = file("${path.module}/jobs/productivity/hass.job")
}

resource "nomad_job" "influxdb" {
  jobspec = file("${path.module}/jobs/storage/influxdb.job")
}

resource "nomad_job" "loki" {
  jobspec = file("${path.module}/jobs/observability/loki.job")
}

resource "nomad_job" "mongo" {
  jobspec = file("${path.module}/jobs/storage/mongo.job")
}

resource "nomad_job" "mass" {
  jobspec = file("${path.module}/jobs/media/mass.job")
}

resource "nomad_job" "pgweb" {
  jobspec = file("${path.module}/jobs/productivity/pgweb.job")
}

resource "nomad_job" "plex" {
  jobspec = file("${path.module}/jobs/media/plex.job")
}

resource "nomad_job" "postgres" {
  jobspec = file("${path.module}/jobs/storage/postgres.job")
}

resource "nomad_job" "prowlarr" {
  jobspec = file("${path.module}/jobs/media/prowlarr.job")
}

resource "nomad_job" "radarr" {
  jobspec = file("${path.module}/jobs/media/radarr.job")
}

resource "nomad_job" "sabnzbd" {
  jobspec = file("${path.module}/jobs/media/sabnzbd.job")
}

resource "nomad_job" "sonarr" {
  jobspec = file("${path.module}/jobs/media/sonarr.job")
}

resource "nomad_job" "transmission" {
  jobspec = file("${path.module}/jobs/media/transmission.job")
}

resource "nomad_job" "unifi" {
  jobspec = file("${path.module}/jobs/networking/unifi.job")
}

resource "nomad_job" "vector" {
  jobspec = file("${path.module}/jobs/observability/vector.job")
  depends_on = [ nomad_job.loki ]
}

resource "nomad_job" "wikijs" {
  jobspec = file("${path.module}/jobs/productivity/wikijs.job")
}

resource "nomad_job" "docker_cleanup" {
  jobspec = file("${path.module}/jobs/maintenance/docker-cleanup.job")
}

resource "nomad_job" "journalctl_cleanup" {
  jobspec = file("${path.module}/jobs/maintenance/journalctl-cleanup.job")
}

resource "nomad_job" "nomad_cleanup" {
  jobspec = file("${path.module}/jobs/maintenance/nomad-cleanup.job")
}


# resource "nomad_job" "csi-controller" {
#   jobspec = file("${path.module}/jobs/storage/csi-controller.job")
# }

# resource "nomad_job" "csi_node" {
#   jobspec = file("${path.module}/jobs/storage/csi-node.job")
# }

# resource "nomad_job" "telegraf" {
#   jobspec = file("${path.module}/jobs/observability/telegraf.job")
# }