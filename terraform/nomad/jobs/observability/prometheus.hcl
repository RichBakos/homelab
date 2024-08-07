job "prometheus" {
  type      = "service"
  namespace = "observability"

  group "prometheus" {
    network {
      port "http" { static = "9090" }
    }

    service {
      name = "prometheus"
      port = "http"
      tags = [
        "traefik.enable=true",
        #       "traefik.http.routers.prometheus.entrypoints=websecure",             				
        "traefik.http.routers.prometheus.middlewares=auth"
      ]
      check {
        type     = "http"
        path     = "/-/healthy"
        name     = "http"
        interval = "5s"
        timeout  = "2s"
      }
    }

    task "prometheus" {
      driver = "docker"

      config {
        image        = "prom/prometheus"
        network_mode = "host"
        ports        = ["http"]
        volumes = [
          "${var.data_dir}/prometheus:/opt/prometheus",
          "local/alerts.yml:/prometheus/alerts.yml",
          "local/prometheus.yml:/etc/prometheus/prometheus.yml",
        ]
      }

      template {
        destination   = "local/prometheus.yml"
        change_mode   = "signal"
        change_signal = "SIGHUP"
        data          = var.prometheus_yaml
      }

      resources {
        cpu    = 1000
        memory = 512
      }
    }
  }
}
