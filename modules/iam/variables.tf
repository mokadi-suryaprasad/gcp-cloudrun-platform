# --------------------
# Project
# --------------------

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

# --------------------
# Service Accounts
# --------------------

variable "tofu_sa" {
  description = "OpenTofu service account name"
  type        = string
}

variable "run_sa" {
  description = "Cloud Run service account name"
  type        = string
}
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "location" {
  description = "Resource region"
  type        = string
}

variable "resource_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "role" {
  description = "IAM role"
  type        = string
}
