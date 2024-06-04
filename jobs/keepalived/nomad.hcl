{{- with nomadVar "nomad/jobs/keepalived_priority" }}
  KEEPALIVED_INTERFACE: {{ sockaddr "GetPrivateInterfaces | include \"network\" \"172.16.30.0/24\" | attr \"name\"" }}
  KEEPALIVED_PRIORITY: {{ env "meta.keepalived_priority" }}
  KEEPALIVED_VIRTUAL_IPS: 
  - {{ .dns_virtual_ip }}/24
  KEEPALIVED_UNICAST_PEERS:
  {{- with $node := node -}} {{ range nodes }} {{- if ne .Address $node.Node.Address }}
  - {{ .Address }}
  {{- end -}} {{- end -}} {{- end }}
{{- end }}