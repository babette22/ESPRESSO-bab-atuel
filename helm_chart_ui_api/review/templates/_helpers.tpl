{{/*
Expand the name of the chart.
*/}}
{{- define "review.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "review.fullname" -}}
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
{{- define "review.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels_01
*/}}
{{- define "review.labels_01" -}}
{{ include "review.selectorLabels_01" . }}
{{- end }}

{{/*
Common labels_02
*/}}
{{- define "review.labels_02" -}}
{{ include "review.selectorLabels_02" . }}
{{- end }}

{{/*
Selector labels_01
*/}}
{{- define "review.selectorLabels_01" -}}
app.kubernetes.io/name: {{ include "review.name" . }}-v1
version: v1
{{- end }}


{{/*
Selector labels_02
*/}}
{{- define "review.selectorLabels_02" -}}
app.kubernetes.io/name: {{ include "review.name" . }}-v2
version: v2
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "review.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "review.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
