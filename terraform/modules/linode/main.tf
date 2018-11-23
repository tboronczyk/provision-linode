resource "linode_instance" "instance" {
    label = "${element(split(".", var.domain), 0)}"
    image = "linode/ubuntu18.04"
    region = "us-east"
    type = "g6-nanode-1"
    authorized_keys = ["${chomp(file(var.ssh_keyfile))}"]
    root_pass = "${var.root_pass}"

    provisioner "remote-exec" {
        inline = [
            "apt-get -y update",
            "apt-get -y install python"
        ]

        connection {
            type = "ssh"
            user = "root"
            password = "${var.root_pass}"
        }
    }
}
