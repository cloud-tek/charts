{{/* vim: set filetype=mustache: */}}
{{/*
    Expand the name of the chart.
*/}}
{{- define "chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
    Create a default fully qualified app name.
    We truncate at 63 chars because some Kubernetes name fields are limited to this 
    (by the DNS naming spec).
*/}}
{{- define "chart.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
    Create an image pull secret
*/}}
{{- define "imagePullSecret" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.common.imagepullsecret.registry (printf "%s:%s" .Values.common.imagepullsecret.username .Values.common.imagepullsecret.password | b64enc) | b64enc }}
{{- end }}


{{/*
    Create Prometheus annotations if Prometheus is enabled
*/}}
{{- define "metadata.annotations.prometheus" -}}
{{- if and .Values.metadata.prometheus (eq .Values.metadata.prometheus.enabled true) -}}
prometheus.io/scrape: "true"
prometheus.io/path: "/status/prometheus"
{{- end -}}
{{- end -}}

{{/*
    Create Linkerd annotations if Linkerd is enabled
*/}}
{{- define "metadata.annotations.linkerd" -}}
{{- if .Values.metadata.linkerd -}}
linkerd.io/inject: {{ .Values.metadata.linkerd.enabled | quote }}
config.alpha.linkerd.io/proxy-wait-before-exit-seconds: "10"
{{- end -}}
{{- end -}}

{{/*
    Create cloudtek labels
*/}}
{{- define "metadata.labels.cloudtek" -}}
ops.cloud-tek.io/environment: {{ .Release.Namespace | quote -}}
{{ if (.Values.metadata.cloudtek) }}
ops.cloud-tek.io/teamName: {{ .Values.metadata.cloudtek.teamName | quote }}
ops.cloud-tek.io/release: {{ .Release.Name | quote }}
ops.cloud-tek.io/buildId: {{ .Values.metadata.cloudtek.buildId | quote }}
ops.cloud-tek.io/project: {{ .Values.metadata.cloudtek.project | quote }}
ops.cloud-tek.io/organization: {{ .Values.metadata.cloudtek.organization | quote }}
ops.cloud-tek.io/branch: {{ .Values.metadata.cloudtek.branch | quote }}
ops.cloud-tek.io/commit: {{ .Values.metadata.cloudtek.commit | quote }}
{{- end -}}
{{- end -}}



{{- define "spec.affinity.nodeAffinity" -}}
nodeAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
    - matchExpressions:
      - key: cloud-tek.io/nodepool
        operator: In
        values:
        - main
{{- end -}}

{{- define "spec.affinity.podAntiAffinity" -}}
podAntiAffinity:
  preferredDuringSchedulingIgnoredDuringExecution:
  - weight: 100
    podAffinityTerm:
      labelSelector:
        matchExpressions:
        - key: app
          operator: In
          values:
          - {{ .Release.Name }}
      topologyKey: kubernetes.io/hostname
{{- end -}}


{{/*
    Create 5s sleep container prestop hook
    https://freecontent.manning.com/handling-client-requests-properly-with-kubernetes/
*/}}
{{- define "spec.containers.lifecycle.prestop" -}}
lifecycle:
  preStop:
    exec:
      command:
        - sh
        - -c
        - "sleep 5"
{{- end -}}

{{- define "deployment.image" -}}
{{- if .Values.deployment.image.registry }}
image: {{ printf "%s/%s/%s:%s" .Values.common.service.image.registry .Values.common.service.image.repository .Values.geo_geojson_svc.service.image.name .Values.common.service.image.tag | quote }}
{{ else }}
image: {{ printf "%s/%s:%s" .Values.common.service.image.repository .Values.geo_geojson_svc.image.name .Values.common.service.image.tag | quote }}
{{ end -}}
imagePullPolicy: {{ .Values.common.service.image.imagePullPolicy | quote }}  
{{- end -}}