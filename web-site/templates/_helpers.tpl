{{/*
Expand the name of the chart.
*/}}
{{- define "web-sites.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "web-sites.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "web-sites.labels" -}}
helm.sh/chart: {{ include "web-sites.chart" . }}
{{ include "web-sites.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "web-sites.selectorLabels" -}}
app.kubernetes.io/name: {{ include "web-sites.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "web-sites.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "web-sites.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
