# --------------------
# Cloud SQL Instance
# --------------------

resource "google_sql_database_instance" "db" {
  project          = var.project_id
  name             = var.gsql_name
  region           = var.gsql_region
  database_version = "MYSQL_8_0"

  settings {
    tier = var.gsql_tier

    availability_type = "ZONAL"

    backup_configuration {
      enabled = true
    }

    ip_configuration {
      ipv4_enabled = true
      ssl_mode     = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"

      # ⚠️ Dev only (allows all IPs)
      authorized_networks {
        name  = "public"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = false
}

# --------------------
# Database
# --------------------

resource "google_sql_database" "main" {
  name     = var.db_name
  instance = google_sql_database_instance.db.name
}

# --------------------
# DB User
# --------------------

resource "google_sql_user" "main" {
  name     = var.db_user
  instance = google_sql_database_instance.db.name
  password = var.db_password
}
