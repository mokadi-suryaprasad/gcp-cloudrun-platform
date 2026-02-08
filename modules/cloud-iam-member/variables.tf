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

variable "member" {
  description = "IAM member (user, serviceAccount, allUsers, etc.)"
  type        = string
}
