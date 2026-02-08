# --------------------
# Outputs
# --------------------

output "tofu_sa_email" {
  description = "OpenTofu Service Account Email"
  value       = google_service_account.tofu.email
}

output "run_sa_email" {
  description = "Cloud Run Service Account Email"
  value       = google_service_account.run.email
}
