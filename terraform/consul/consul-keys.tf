resource "consul_key_prefix" "coredns" {
  path_prefix = "homelab/coredns/"
  subkeys = {
    "corefile"  = file("${path.module}/files/coredns/corefile"),
  }
}

resource "consul_key_prefix" "keepalived" {
  path_prefix = "homelab/keepalived/"
  subkeys = {
    "keepalived.conf"  = file("${path.module}/files/keepalived/keepalived.conf"),
  }
}

resource "consul_key_prefix" "loki" {
  path_prefix = "homelab/loki/"
  subkeys = {
    "loki.yaml"  = file("${path.module}/files/loki/loki.yaml"),
  }
}

resource "consul_key_prefix" "prometheus" {
  path_prefix = "homelab/prometheus/"
  subkeys = {
    "prometheus.yml" = file("${path.module}/files/prometheus/prometheus.yaml"),
  }
}

resource "consul_key_prefix" "traefik" { 
  path_prefix = "homelab/traefik/"
  subkeys = {
    "traefik.toml"  = file("${path.module}/files/traefik/traefik.toml"),
    "external.toml" = file("${path.module}/files/traefik/external.toml"),
  }
}

resource "consul_key_prefix" "vector" {
  path_prefix = "homelab/vector/"
  subkeys = {
    "vector.toml"  = file("${path.module}/files/vector/vector.toml"),
  }
}