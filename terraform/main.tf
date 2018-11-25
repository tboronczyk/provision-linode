module "linode_provision" {
    source = "./modules/linode"
    token = "${var.linode_token}"
    domain = "${var.domain}"
    root_pass = "${random_string.password.result}"
}

module "setup" {
    source = "./modules/setup"
    host = "${module.linode_provision.linode_provision_ip}"
    root_pass = "${random_string.password.result}"
    domain = "${var.domain}"
    user = "${var.user}"
    ssh_privkey = "${var.ssh_privkey}"
    ssh_pubkey = "${var.ssh_pubkey}"
}

output "ip" {
    value = "${module.linode_provision.linode_provision_ip}"
}

output "root_pass" {
    value = "${random_string.password.result}"
}
