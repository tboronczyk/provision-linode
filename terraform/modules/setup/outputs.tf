output "setup_dkim_value" {
  depends_on = ["null_resource.ansible"]
  value = "${file("mail.dkim-value")}"
}
