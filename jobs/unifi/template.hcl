{{- with nomadVar "nomad/jobs" }}
  PUID={{ .puid }}
  PGID={{ .pgid }}
  TZ={{ .tz }}
{{- end }}
{{- with nomadVar "nomad/jobs/unifi" }}
  MONGO_USER={{ .mongo_user }}
  MONGO_PASS={{ .mongo_pass }}
  MONGO_HOST={{ .mongo_host }}
  MONGO_PORT={{ .mongo_port }}
  MONGO_DBNAME={{ .mongo_dbname }}
{{- end }}