job "unifi" {
  type      = "service"
  namespace = "networking"

  group "unifi" {

    network {
      port "http" { static = "8443" }
    }

    volume unifi {
      type   = "host"
      source = "unifi"
    }

    service {
      name = "unifi"
      port = "http"
      tags = [
        "traefik.enable=true",
        "traefik.http.routers.unifi.entrypoints=websecure",
        "traefik.http.services.unifi.loadbalancer.server.scheme=https",
        "traefik.http.routers.unifi.middlewares=auth",
      ]
      check {
        type     = "tcp"
        port     = "http"
        interval = "10s"
        timeout  = "30s"
      }
    }

    task "unifi" {
      driver = "docker"

      config {
        image        = "linuxserver/unifi-network-application:8.3.32"
        network_mode = "host"
        ports        = ["http"]
        volumes = [
          "/mnt/volumes/unifi/init-mongo.js:/docker-entrypoint-initdb.d/init-mongo.js:ro",
        ]
      }

      volume_mount {
        volume      = "unifi"
        destination = "/config"
      }

      resources {
        cpu    = 1000
        memory = 1536
      }

      template {
        env         = true
        destination = "local/unifi.env"
        data        = <<EOF
{{- with nomadVar "nomad/jobs/unifi" }}
{{- range .Tuples }}
{{ .K }}={{ .V }}
{{- end }}
{{- end }}     
EOF
      }
    }
  }
}