resource "linode_instance" "instance" {
    label = "${element(split(".", var.domain), 0)}"
    image = "linode/ubuntu18.04"
    region = "us-east"
    type = "g6-nanode-1"
    root_pass = "${var.root_pass}"
}
