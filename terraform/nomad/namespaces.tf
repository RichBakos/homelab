
resource "nomad_namespace" "maintenance" {
  name        = "maintenance"
  description = "The namespace for maintenance tasks"
}

resource "nomad_namespace" "observability" {
  name        = "observability"
  description = "The namespace for jobs that provide observability tools"
}

resource "nomad_namespace" "storage" {
  name        = "storage"
  description = "The namespace for jobs that provide storage functionality"
}

resource "nomad_namespace" "networking" {
  name        = "networking"
  description = "The namespace for jobs that provide networking functionality"
}

resource "nomad_namespace" "security" {
  name        = "security"
  description = "The namespace for jobs that provide security functionality"
}

resource "nomad_namespace" "productivity" {
  name        = "productivity"
  description = "The namespace for jobs that provide productivity tools"
}

resource "nomad_namespace" "media" {
  name        = "media"
  description = "The namespace for jobs that provide home media functionality"
}