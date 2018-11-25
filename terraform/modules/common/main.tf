resource "null_resource" "setup" {
    connection {
        type = "ssh"
        user = "root"
        password = "${var.root_pass}"
        host = "${var.host}"
    }

    provisioner "remote-exec" {
        inline = [
            # install Python dependency for Ansible
            "apt-get -y install python",

            # non-root user account
            "useradd -m -s /bin/bash ${var.user}",
            "usermod -a -G sudo ${var.user}",
            "echo '${var.user} ALL = NOPASSWD : ALL' > /etc/sudoers.d/${var.user}",
            "mkdir /home/${var.user}/.ssh",
            "echo '${file(var.ssh_pubkey)}' > /home/${var.user}/.ssh/authorized_keys",
            "chown -R tboronczyk:tboronczyk /home/${var.user}/.ssh",
            "chmod 700 /home/${var.user}/.ssh",
            "chmod 600 /home/${var.user}/.ssh/authorized_keys"
        ]
    }
}

resource "null_resource" "ansible" {
    provisioner "local-exec" {
        command = "./generate-inventory.sh > ansible-inventory"

        environment {
            USERNAME = "${var.user}"
            DOMAIN = "${var.domain}"
            SSH_PRIVKEY = "${var.ssh_privkey}"
            HOST_IP = "${var.host}"
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -i ansible-inventory ../ansible/site.yaml"
    }
}
