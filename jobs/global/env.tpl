{{- with nomadVar "nomad/jobs" }}
	PUID={{ .puid }}
	PGID={{ .pgid }}
	TZ={{ .tz }}
{{- end }}