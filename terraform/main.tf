module "linode_setup" {
    source = "./modules/linode"
    linode_token = "${var.linode_token}"
    domain = "${var.domain}"
    ssh_keyfile = "${var.ssh_keyfile}"
    root_pass = "${random_string.password.result}"
}

output "ip" {
    value = "${module.linode_setup.linode_setup_ip}"
}
