{{- define "spec.containers.deployment.image" -}}
{{- if .Values.common.image.registry -}}
image: {{ printf "%s/%s/%s:%s" .Values.common.image.registry .Values.deployment.image.repository .Values.deployment.image.name .Values.deployment.image.tag | quote }}
{{ else }}
image: {{ printf "%s/%s:%s" .Values.deployment.image.repository .Values.deployment.image.name .Values.deployment.image.tag | quote }}
{{- end -}}
{{- if .Values.common.image.imagePullPolicy -}}
imagePullPolicy: {{ .Values.common.image.imagePullPolicy | quote }}
{{- end -}}
{{- end -}}

{{- define "spec.containers.job.image" -}}
{{- if .Values.common.image.registry -}}
image: {{ printf "%s/%s/%s:%s" .Values.common.image.registry .Values.job.image.repository .Values.job.image.name .Values.job.image.tag | quote }}
{{ else }}
image: {{ printf "%s/%s:%s" .Values.job.image.repository .Values.job.image.name .Values.job.image.tag | quote }}
{{- end -}}
{{- if .Values.common.image.imagePullPolicy -}}
imagePullPolicy: {{ .Values.common.image.imagePullPolicy | quote }}
{{- end -}}
{{- end -}}
