# --------------------
# Project
# --------------------

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "Default region"
  type        = string
  default     = "asia-south1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# --------------------
# IAM
# --------------------

variable "tofu_sa" {
  description = "OpenTofu service account name"
  type        = string
}

variable "run_sa" {
  description = "Cloud Run service account name"
  type        = string
}

# --------------------
# Database
# --------------------

variable "db_secret_name" {
  description = "Secret name for DB password"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

# --------------------
# Cloud SQL
# --------------------

variable "gsql_name" {
  description = "Cloud SQL instance name"
  type        = string
}

variable "gsql_region" {
  description = "Cloud SQL region"
  type        = string
}

variable "gsql_tier" {
  description = "Cloud SQL tier"
  type        = string
  default     = "db-f1-micro"
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

variable "cloudrun_public" {
  type    = bool
  default = false   # Prod = private
}
