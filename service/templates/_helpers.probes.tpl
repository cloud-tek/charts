{{/*
    Create the startup probe
*/}}
{{- define "spec.containers.startupProbe" -}}
startupProbe:
  httpGet:
    path: /ping
    scheme: HTTP
    port: 80
    httpHeaders:
    - name: X-k8s-healthcheck
      value: {{ .Release.Namespace }}
  periodSeconds: 10
  failureThreshold: 35
{{- end -}}

{{/*
    Create the startup liveness probe
*/}}
{{- define "spec.containers.livenessProbe" -}}
livenessProbe:
  httpGet:
    path: /ping
    scheme: HTTP
    port: 80
    httpHeaders:
    - name: X-k8s-healthcheck
      value: {{ .Release.Namespace }}
  periodSeconds: 15
{{- end -}}

{{/*
    Create the readiness probe
*/}}
{{- define "spec.containers.readinessProbe" -}}
readinessProbe:
  httpGet:
    path: /health/ready
    scheme: HTTP
    port: 80
    httpHeaders:
    - name: X-k8s-starthealthcheck
      value: {{ .Release.Namespace }}
  periodSeconds: 10
  timeoutSeconds: 20
  successThreshold: 1
  failureThreshold: 20
{{- end -}}