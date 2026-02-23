{{/*
Expand the name of the chart.
*/}}
{{- define "web-site.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "web-site.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "web-site.labels" -}}
helm.sh/chart: {{ include "web-site.chart" . }}
{{ include "web-site.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "web-site.selectorLabels" -}}
app.kubernetes.io/name: {{ include "web-site.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "web-site.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "web-site.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
