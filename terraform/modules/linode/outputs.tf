output "linode_provision_ip" {
  value = "${linode_instance.instance.ip_address}"
}
