module "linode_setup" {
    source = "./modules/linode"
    linode_token = "${var.linode_token}"
    domain = "${var.domain}"
    authorized_keys = "${var.authorized_keys}"
    root_pass = "${var.root_pass}"
}
