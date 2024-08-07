job "grafana" {
  type      = "service"
  namespace = "observability"

  group "grafana" {

    network {
      port "http" {
        to = 3000
      }
    }

    volume "grafana" {
      type   = "host"
      source = "grafana"
    }

    service {
      name = "grafana"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.grafana.entrypoints=websecure",
        "traefik.http.routers.grafana.middlewares=auth"
      ]

      check {
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "5s"
      }
    }

    task "grafana" {
      driver = "docker"
      user   = "root"

      config {
        image        = "grafana/grafana-oss:11.1.3"
        network_mode = "host"
        ports        = ["http"]
      }

      volume_mount {
        volume      = "grafana"
        destination = "/var/lib/grafana"
      }

      resources {
        cpu    = 200
        memory = 256
      }

      template {
        destination = "secrets/grafana.env"
        env         = true
        data        = <<EOF
{{- with nomadVar "nomad/jobs/grafana" }}
{{- range .Tuples }}
{{ .K }}={{ .V }}
{{- end }}
{{- end }}
EOF
      }
    }
  }
}