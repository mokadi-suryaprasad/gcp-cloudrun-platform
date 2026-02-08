# --------------------
# Project
# --------------------

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "environment" {
  description = "Environment name (dev/stage/prod)"
  type        = string
  default     = "dev"
}

# --------------------
# Secret
# --------------------

variable "secret_name" {
  description = "Secret name in Secret Manager"
  type        = string
}

variable "value" {
  description = "Secret value"
  type        = string
  sensitive   = true
}
