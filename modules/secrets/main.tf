# --------------------
# Secret
# --------------------

resource "google_secret_manager_secret" "secret" {
  project   = var.project_id
  secret_id = var.secret_name

  replication {
    auto {}
  }

  labels = {
    managed_by = "opentofu"
    env        = var.environment
  }
}

# --------------------
# Secret Version
# --------------------

resource "google_secret_manager_secret_version" "version" {
  secret      = google_secret_manager_secret.secret.id
  secret_data = var.value
}
