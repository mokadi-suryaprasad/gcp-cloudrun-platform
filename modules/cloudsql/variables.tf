# --------------------
# Project
# --------------------

variable "project_id" {
  description = "GCP Project ID"
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
  description = "Machine tier"
  type        = string
  default     = "db-f1-micro"
}

# --------------------
# Database
# --------------------

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database username"
  type        = string
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}
