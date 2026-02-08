# --------------------
# Cloud Run Service
# --------------------

resource "google_cloud_run_v2_service" "svc" {

  project  = var.project_id
  name     = var.cloudrun_name
  location = var.cloudrun_location

  ingress = "INGRESS_TRAFFIC_ALL"


  template {

    service_account = var.cloudrun_sa

    labels = {
      managed_by = "opentofu"
      env        = var.environment
    }

    scaling {
      min_instance_count = 0
      max_instance_count = 2
    }

    containers {

      image = var.cloudrun_image

      resources {
        limits = {
          cpu    = "1"
          memory = "512Mi"
        }
      }

      # --------------------
      # Environment
      # --------------------

      env {
        name  = "DB_USER"
        value = var.db_user
      }

      env {
        name  = "DB_NAME"
        value = var.db_name
      }

      env {
        name  = "DB_SOCKET"
        value = "/cloudsql/${var.sql_conn}"
      }

      env {
        name = "DB_PASSWORD"

        value_source {
          secret_key_ref {
            secret  = var.db_secret_name
            version = "latest"
          }
        }
      }

      # --------------------
      # Cloud SQL Mount (✅ MUST be inside containers)
      # --------------------

      volume_mounts {
        name       = "cloudsql"
        mount_path = "/cloudsql"
      }
    }

    # --------------------
    # Cloud SQL Volume
    # --------------------

    volumes {
      name = "cloudsql"

      cloud_sql_instance {
        instances = [var.sql_conn]
      }
    }
  }
}
