# --------------------
# IAM
# --------------------

output "tofu_service_account" {
  description = "Tofu SA Email"
  value       = module.iam.tofu_sa_email
}

output "cloudrun_service_account" {
  description = "Cloud Run SA Email"
  value       = module.iam.run_sa_email
}

# --------------------
# Secrets
# --------------------

output "db_secret_name" {
  description = "DB Secret Name"
  value       = module.secret.secret_name
}

# --------------------
# Cloud SQL
# --------------------

output "cloudsql_instance_name" {
  description = "SQL Instance Name"
  value       = module.cloudsql.instance_name
}

output "cloudsql_connection_name" {
  description = "SQL Connection Name"
  value       = module.cloudsql.connection_name
}

output "cloudsql_public_ip" {
  description = "SQL Public IP"
  value       = module.cloudsql.public_ip
}

# --------------------
# Cloud Run
# --------------------

output "cloudrun_name" {
  description = "Cloud Run Service"
  value       = module.cloudrun.service_name
}

output "cloudrun_url" {
  description = "Cloud Run URL"
  value       = module.cloudrun.service_url
}
