job "samba" {
  type      = "service"
  namespace = "networking"

  group "samba" {

    network {
      port "smb" { static = "445" }
    }

    volume "samba" {
      type   = "host"
      source = "samba"
    }

    service {
      name = "samba"
      port = "smb"
      check {
        type     = "tcp"
        interval = "60s"
        timeout  = "20s"
      }
    }

    task "samba" {
      driver = "docker"

      config {
        image        = "servercontainers/samba:smbd-only-a3.19.0-s4.18.9-r0"
        ports        = ["smb"]
        network_mode = "host"
      }

      volume_mount {
        volume      = "samba"
        destination = "/shares/homelab"
      }

      resources {
        cpu    = 200
        memory = 256
      }

      template {
        env         = true
        destination = "secrets/env"
        data        = <<EOF
{{- with nomadVar "nomad/jobs/forward-auth" }}
{{- range .Tuples }}
{{ .K }}={{ .V }}
{{- end }}
{{- end }}
EOF
      }
    }
  }
}
