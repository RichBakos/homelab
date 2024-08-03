job "coredns" {
  type      = "system"
  namespace = "networking"

  group "coredns" {
    network {
      port "dns" { static = "53" }
    }

    task "coredns" {
      driver = "docker"

      config {
        image        = "coredns/coredns:1.11.3"
        network_mode = "host"
        ports        = ["dns"]
        args         = ["-conf", "/local/coredns/corefile"]
      }

      template {
        change_mode = "restart"
        destination = "local/coredns/corefile"
        data        = <<EOF
{{- key "homelab/coredns/corefile"}}
EOF
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}