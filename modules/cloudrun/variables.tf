# --------------------
# Project
# --------------------

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# --------------------
# Cloud Run
# --------------------

variable "cloudrun_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "cloudrun_location" {
  description = "Cloud Run region"
  type        = string
}

variable "cloudrun_image" {
  description = "Container image"
  type        = string
}

variable "cloudrun_sa" {
  description = "Service account email"
  type        = string
}

variable "ingress_type" {
  description = "Ingress type"
  type        = string
  default     = "INGRESS_TRAFFIC_ALL"
}


# --------------------
# Database
# --------------------

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_secret_name" {
  description = "Secret Manager name for DB password"
  type        = string
}

variable "sql_conn" {
  description = "Cloud SQL connection name"
  type        = string
}
