{{/*
Common labels
*/}}
{{- define "ghost.labels" -}}
app.kubernetes.io/name: {{ include "ghost.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Standard labels
*/}}
{{- define "ghost.standardLabels" -}}
{{- include "ghost.labels" . | nindent 4 }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/*
Name of the chart
*/}}
{{- define "ghost.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Fullname template
*/}}
{{- define "ghost.fullname" -}}
{{- if .Values.fullnameOverride -}}
  {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
  {{- $name := default .Chart.Name .Values.nameOverride -}}
  {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Service name
*/}}
{{- define "ghost.serviceName" -}}
{{- printf "%s-%s" (include "ghost.fullname" .) "service" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Deployment name
*/}}
{{- define "ghost.deploymentName" -}}
{{- printf "%s-%s" (include "ghost.fullname" .) "deployment" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
