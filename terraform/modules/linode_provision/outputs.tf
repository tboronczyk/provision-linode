output "linode_provision_domain_id" {
  value = "${linode_domain.domain.id}"
}

output "linode_provision_ip_address" {
  value = "${linode_instance.instance.ip_address}"
}
