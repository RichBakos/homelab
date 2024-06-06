{{- with nomadVar "nomad/jobs/influxdb" }}
DOCKER_INFLUXDB_INIT_MODE={{ .mode }}
DOCKER_INFLUXDB_INIT_USERNAME={{ .user }}
DOCKER_INFLUXDB_INIT_PASSWORD={{ .password }}
DOCKER_INFLUXDB_INIT_ORG={{.org }}
DOCKER_INFLUXDB_INIT_BUCKET={{ .bucket }}
{{- end }}