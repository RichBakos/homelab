job "cannery" {
  type      = "service"
  namespace = "productivity"

  group "cannery" {

    network {
      port "http" { static = "4000" }
    }

    service {
      name = "${NOMAD_JOB_NAME}"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.${NOMAD_JOB_NAME}.middlewares=forward-auth"
      ]

      check {
        type     = "tcp"
        interval = "60s"
        timeout  = "20s"
      }
    }

    task "cannery" {
      driver = "docker"

      config {
        image        = "shibaobun/cannery:latest"
        network_mode = "host"
        ports        = ["http"]
        volumes = [
          "${var.services}/cannery:/config",
        ]
      }

      template {
        env         = true
        destination = "secrets/env"
        data        = <<EOF
{{- with nomadVar "nomad/jobs/cannery" }}
{{- range .Tuples }}
{{ .K }}={{ .V }}
{{- end }}
{{- end }}
EOF        
      }

      resources {
        cpu    = 200
        memory = 256
      }
    }
  }
}
