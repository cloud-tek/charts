{{/*
    Env variables containing core k8s information
*/}}
{{- define "spec.containers.env.k8s" -}}
- name: KUBERNETES_NAMESPACE
  valueFrom:
    fieldRef:
      fieldPath: metadata.namespace
- name: Pod__Ip__Address
  valueFrom:
    fieldRef:
      fieldPath: status.podIP
- name: Environment
  value: {{ .Release.Namespace | quote }}
{{- end -}}

{{/*
    Env variables containing basic application information
*/}}
{{- define "spec.containers.env.app" -}}
- name: ApplicationName
  value: {{ .Values.deployment.image.name }}
{{ if (.Values.metadata.cloudtek) -}}
- name: TeamName
  value: {{ .Values.metadata.cloudtek.teamName }}
{{- end -}}
{{- end -}}

{{/*
    Env variables containing dotnet GC configuration for concurrent workstation GC
*/}}
{{- define "spec.containers.env.gc" -}}
- name: COMPlus_gcServer
  value: "0"
- name: COMPlus_gcConcurrent
  value: "1"
{{- end -}}

{{/*
    Env variables containing keyvault information
*/}}
{{- define "spec.containers.env.azure.keyvault" -}}
- name: KeyVault__Uri
  valueFrom:
    secretKeyRef:
      name: secret-keyvault
      key: KeyVault__Uri
- name: KeyVault__ServiceDiscovery__Uri
  valueFrom:
    secretKeyRef:
      name: secret-keyvault
      key: KeyVault__ServiceDiscovery__Uri
- name: KeyVault__ClientId
  valueFrom:
    secretKeyRef:
      name: {{ printf "secret-%s" .Values.deployment.image.name }}
      key: KeyVault__ClientId
- name: KeyVault__ClientSecret
  valueFrom:
    secretKeyRef:
      name: {{ printf "secret-%s" .Values.deployment.image.name }}
      key: KeyVault__ClientSecret
- name: KeyVault__ClientSecretGenerationDate
  valueFrom:
    secretKeyRef:
      name: {{ printf "secret-%s" .Values.deployment.image.name }}
      key: KeyVault__ClientSecretGenerationDate
{{- end -}}