# --------------------
# Outputs
# --------------------

output "instance_name" {
  description = "Cloud SQL instance name"
  value       = google_sql_database_instance.db.name
}

output "connection_name" {
  description = "Cloud SQL connection name"
  value       = google_sql_database_instance.db.connection_name
}

output "public_ip" {
  description = "Cloud SQL public IP"
  value       = google_sql_database_instance.db.public_ip_address
}

output "private_ip" {
  description = "Cloud SQL private IP"
  value       = google_sql_database_instance.db.private_ip_address
}
