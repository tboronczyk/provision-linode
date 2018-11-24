module "linode_provision" {
    source = "./modules/linode"
    token = "${var.linode_token}"
    domain = "${var.domain}"
    root_pass = "${random_string.password.result}"
}

module "common_setup" {
    source = "./modules/common"
    host = "${module.linode_provision.linode_provision_ip}"
    root_pass = "${random_string.password.result}"
    user = "${var.user}"
    ssh_keyfile = "${var.ssh_keyfile}"
}

output "ip" {
    value = "${module.linode_provision.linode_provision_ip}"
}

output "root_pass" {
    value = "${random_string.password.result}"
}
