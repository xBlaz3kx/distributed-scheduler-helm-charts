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