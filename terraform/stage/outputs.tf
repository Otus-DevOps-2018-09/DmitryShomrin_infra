output "app_external_ip" {
  value = "${module.app.app_external_ip}"
}
#output "load_bal_external_ip" {
#  value = "${google_compute_global_forwarding_rule.fw-rule.ip_address}"
#}
