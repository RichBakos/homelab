{{- with nomadVar "nomad/jobs/auth" }}
	PROVIDERS_GOOGLE_CLIENT_ID={{ .providers_google_client_id }}
	PROVIDERS_GOOGLE_CLIENT_SECRET={{ .providers_google_client_secret }}
	SECRET={{ .secret }}
	AUTH_HOST={{ .auth_host }}
	COOKIE_DOMAIN={{ .cookie_domain }}
	WHITELIST={{ .whitelist }}
	LOG_LEVEL={{ .log_level }}
	INSECURE_COOKIE={{ .insecure_cookie }}
{{- end }}