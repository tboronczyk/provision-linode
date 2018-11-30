module "linode_provision" {
    source = "./modules/linode_provision"
    token = "${var.linode_token}"
    domain = "${var.domain}"
    root_ssh_pubkey = "${var.root_ssh_pubkey}"
}

module "setup" {
    source = "./modules/setup"
    host = "${module.linode_provision.linode_provision_ip_address}"
    domain = "${var.domain}"
    username = "${var.username}"
    root_ssh_privkey = "${var.root_ssh_privkey}"
    user_ssh_privkey = "${var.user_ssh_privkey}"
    user_ssh_pubkey = "${var.user_ssh_pubkey}"
}

module "linode_dkim" {
    source = "./modules/linode_dkim"
    token = "${var.linode_token}"
    domain_id = "${module.linode_provision.linode_provision_domain_id}"
    dkim_value = "${module.setup.setup_dkim_key}"
}
