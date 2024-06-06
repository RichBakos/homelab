{{- with nomadVar "nomad/jobs/plex" }}
	PLEX_CLAIM={{ .plex_claim }}
{{- end }}      
{{- with nomadVar "nomad/jobs" }}
	PLEX_UID={{ .puid }}
	PLEX_GID={{ .pgid }}
	TZ={{ .tz }}
{{- end }}