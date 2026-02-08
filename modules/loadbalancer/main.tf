resource "google_compute_region_network_endpoint_group" "neg" {
  for_each = var.services

  name                  = "${each.key}-neg"
  region                = var.region
  network_endpoint_type = "SERVERLESS"

  cloud_run {
    service = each.value.name
  }
}

resource "google_compute_backend_service" "backend" {
  for_each = var.services

  name                  = "${each.key}-backend"
  protocol              = "HTTP"
  load_balancing_scheme = "EXTERNAL_MANAGED"

  backend {
    group = google_compute_region_network_endpoint_group.neg[each.key].id
  }
}

resource "google_compute_url_map" "map" {

  name = "cr-map"

  default_service = google_compute_backend_service.backend["api"].id

  host_rule {
    hosts        = ["*"]
    path_matcher = "routes"
  }

  path_matcher {
    name            = "routes"
    default_service = google_compute_backend_service.backend["api"].id

    dynamic "path_rule" {
      for_each = var.services

      content {
        paths   = [path_rule.value.path]
        service = google_compute_backend_service.backend[path_rule.key].id
      }
    }
  }
}

resource "google_compute_target_http_proxy" "proxy" {
  name    = "cr-proxy"
  url_map = google_compute_url_map.map.id
}

resource "google_compute_global_forwarding_rule" "rule" {
  name       = "cr-http"
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}