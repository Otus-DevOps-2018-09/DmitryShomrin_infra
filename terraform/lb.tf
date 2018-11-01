resource "google_compute_instance_group" "loadbal" {
  name        = "app-group"
  description = "App instance group"

  instances = ["${google_compute_instance.app.*.self_link}"]

  named_port {
    name = "puma-port"
    port = "9292"
  }

  zone = "${var.zone}"
}

resource "google_compute_http_health_check" "hc" {
  name               = "app-health-check"
  request_path       = "/"
  timeout_sec        = 3
  check_interval_sec = 3
  port               = "9292"
}

resource "google_compute_backend_service" "app-backend" {
  name        = "app-backend"
  port_name   = "puma-port"
  protocol    = "HTTP"
  timeout_sec = 3

  backend {
    group = "${google_compute_instance_group.loadbal.self_link}"
  }

  health_checks = ["${google_compute_http_health_check.hc.self_link}"]
}

resource "google_compute_url_map" "app-map" {
  name        = "urlmap"
  description = "url map"

  default_service = "${google_compute_backend_service.app-backend.self_link}"
}

resource "google_compute_target_http_proxy" "app-proxy" {
  name    = "app-proxy"
  url_map = "${google_compute_url_map.app-map.self_link}"
}

resource "google_compute_global_forwarding_rule" "fw-rule" {
  name       = "website-forwarding-rule"
  target     = "${google_compute_target_http_proxy.app-proxy.self_link}"
  port_range = "80"
}
