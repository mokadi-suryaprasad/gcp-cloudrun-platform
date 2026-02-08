# --------------------
# IAM
# --------------------

module "iam" {
  source = "./modules/iam"

  project_id = var.project_id
  tofu_sa    = var.tofu_sa
  run_sa     = var.run_sa
}

# --------------------
# Secret Manager
# --------------------

module "secret" {
  source = "./modules/secrets"

  project_id  = var.project_id
  environment = var.environment

  secret_name = var.db_secret_name
  value       = var.db_password
}

# --------------------
# Cloud SQL
# --------------------

module "cloudsql" {
  source = "./modules/cloudsql"

  project_id = var.project_id

  gsql_name   = var.gsql_name
  gsql_region = var.gsql_region
  gsql_tier   = var.gsql_tier

  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
}

# --------------------
# Cloud Run
# --------------------

module "cloudrun" {
  source = "./modules/cloudrun"

  project_id  = var.project_id
  environment = var.environment

  cloudrun_name     = var.cloudrun_name
  cloudrun_location = var.cloudrun_location
  cloudrun_image    = var.cloudrun_image

  cloudrun_sa = module.iam.run_sa_email

  db_user = var.db_user
  db_name = var.db_name

  db_secret_name = module.secret.secret_name
  sql_conn       = module.cloudsql.connection_name
}

module "cloudrun_public_access" {

  count  = var.cloudrun_public ? 1 : 0
  source = "./modules/cloud-iam-member"

  project_id = var.project_id
  location   = var.cloudrun_location

  resource_name = module.cloudrun.service_name

  role   = "roles/run.invoker"
  member = "allUsers"
}
