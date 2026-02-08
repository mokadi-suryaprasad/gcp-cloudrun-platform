# --------------------
# Outputs
# --------------------

output "secret_name" {
  description = "Secret name"
  value       = google_secret_manager_secret.secret.secret_id
}

output "secret_id" {
  description = "Full secret resource ID"
  value       = google_secret_manager_secret.secret.id
}
