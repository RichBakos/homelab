{{- with nomadVar "nomad/jobs/samba" }}
	ACCOUNT_rbakos={{ .password }}
	UID_rbakos={{ .uid }}
	SAMBA_volumes_CONFIG_homelab={{ .share }}
{{- end }}