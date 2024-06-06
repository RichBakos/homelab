{{- with nomadVar "nomad/jobs/coredns" }}
  . {
    forward . {{ .dns_server_ip }}
    log
    errors
    prometheus {{ env "NOMAD_IP_dns" }}:9153
  }
  consul.:53 {
    forward . 127.0.0.1:8600
    log
    prometheus {{ env "NOMAD_IP_dns" }}:9153
  }
{{- end}}