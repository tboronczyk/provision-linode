output "ip_address" {
    value = "${module.linode_provision.linode_provision_ip_address}"
}

output "root_password" {
    value = "${random_string.password.result}"
}
