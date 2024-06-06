global:
  scrape_interval: 60s
  scrape_timeout: 10s
  evaluation_interval: 60s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ["prometheus.service.consul:9090"]

  - job_name: server-stats
    static_configs:
      - targets:
        - "clarkson.node.consul:8500"
        - "logan.node.consul:8500"
        - "speer.node.consul:8500"

  - job_name: coredns
    static_configs:
      - targets: ["coredns.service.consul:9153"]