module "linode_provision" {
    source = "./modules/linode_provision"
    token = "${var.linode_token}"
    domain = "${var.domain}"
    root_pass = "${random_string.password.result}"
}

module "setup" {
    source = "./modules/setup"
    host = "${module.linode_provision.linode_provision_ip_address}"
    root_pass = "${random_string.password.result}"
    domain = "${var.domain}"
    user = "${var.user}"
    ssh_privkey = "${var.ssh_privkey}"
    ssh_pubkey = "${var.ssh_pubkey}"
}

module "linode_dkim" {
    source = "./modules/linode_dkim"
    token = "${var.linode_token}"
    domain_id = "${module.linode_provision.linode_provision_domain_id}"
    dkim_value = "${module.setup.setup_dkim_key}"
}
