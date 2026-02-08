# --------------------
# Service Accounts
# --------------------

resource "google_service_account" "tofu" {
  account_id   = var.tofu_sa
  display_name = "OpenTofu Deployer"
}

resource "google_service_account" "run" {
  account_id   = var.run_sa
  display_name = "Cloud Run Runtime"
}

# --------------------
# OpenTofu Permissions
# --------------------

# ⚠️ Avoid roles/editor in production
# Replace with minimum required roles

resource "google_project_iam_member" "tofu_owner" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.tofu.email}"
}

# (Later we can reduce this to least privilege)

# --------------------
# Cloud Run Permissions
# --------------------

# Cloud SQL Access
resource "google_project_iam_member" "run_sql" {
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.run.email}"
}

# Secret Manager Access
resource "google_project_iam_member" "run_secret" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.run.email}"
}

# Logging
resource "google_project_iam_member" "run_log" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.run.email}"
}

# Monitoring
resource "google_project_iam_member" "run_metric" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.run.email}"
}