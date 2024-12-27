{{/*
Expand the name of the chart.
*/}}
{{- define "distributed-scheduler.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "distributed-scheduler.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "distributed-scheduler.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "distributed-scheduler.labels" -}}
helm.sh/chart: {{ include "distributed-scheduler.chart" . }}
{{ include "distributed-scheduler.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "distributed-scheduler.selectorLabels" -}}
{{- if .Args -}}
app.kubernetes.io/name: {{ .Args.Values.name }}
app.kubernetes.io/instance: {{ .Args.Values.name }}
{{- else -}}
app.kubernetes.io/name: {{ include "distributed-scheduler.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "distributed-scheduler.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "distributed-scheduler.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Check the migration type value and fail if unexpected
*/}}
{{- define "distributed-scheduler.automigration.typeVerification" -}}
{{- if and .Values.automigration.enabled  .Values.automigration.type }}
  {{- if and (ne .Values.automigration.type "initContainer") (ne .Values.automigration.type "job") }}
    {{- fail "distributed-scheduler.automigration.type must be either 'initContainer' or 'job'" -}}
  {{- end }}
{{- end }}
{{- end }}