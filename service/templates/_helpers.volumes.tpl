{{/*
    Appends cloudtek-local-pemstore to the volumes section
*/}}
{{- define "volumes.cloudtek-local-pemstore" -}}
- name: cloudtek-local-pemstore
  configMap:
    name: cloudtek-local-pemstore
{{- end -}}

{{- define "volumeMounts.cloudtek-local-pemstore" -}}
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/POZ-PKI-000_CAROOT-ALLEGROGROUP.pem
  subPath: POZ-PKI-000_CAROOT-ALLEGROGROUP.pem
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/ed3ff339.0
  subPath: POZ-PKI-000_CAROOT-ALLEGROGROUP.pem
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/af14d7dd.0
  subPath: POZ-PKI-000_CAROOT-ALLEGROGROUP.pem
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/POZ-PKI-001.allegrogroup.internal_CAENT-ALLEGROGROUP.pem
  subPath: POZ-PKI-001.allegrogroup.internal_CAENT-ALLEGROGROUP.pem
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/10bd74a6.0
  subPath: POZ-PKI-001.allegrogroup.internal_CAENT-ALLEGROGROUP.pem
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/a55327c4.0
  subPath: POZ-PKI-001.allegrogroup.internal_CAENT-ALLEGROGROUP.pem
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/TST-PKI-000_TST-CAROOT.pem
  subPath: TST-PKI-000_TST-CAROOT.crt
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/21902eb7.0
  subPath: TST-PKI-000_TST-CAROOT.crt
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/TST-PKI-000_TST-CAROOT_1.pem
  subPath: TST-PKI-000_TST-CAROOT_1.crt
  readOnly: false
- name: cloudtek-local-pemstore
  mountPath: /etc/ssl/certs/21902eb7.1
  subPath: TST-PKI-000_TST-CAROOT_1.crt
  readOnly: false
{{- end -}}