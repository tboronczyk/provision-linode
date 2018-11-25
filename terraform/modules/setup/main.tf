resource "null_resource" "setup" {
    provisioner "remote-exec" {
        connection {
            type = "ssh"
            user = "root"
            password = "${var.root_pass}"
            host = "${var.host}"
        }

        inline = [
            # install Python dependency for Ansible
            "which python || apt-get -y install python",

            # non-root user account
            "id -u ${var.user} || useradd -m -s /bin/bash ${var.user}",
            "groups ${var.user} | grep -q sudo || usermod -a -G sudo ${var.user}",
            "[ -f /etc/sudoers.d/${var.user} ] || echo '${var.user} ALL = NOPASSWD : ALL' > /etc/sudoers.d/${var.user}",
            "[ -d /home/${var.user}/.ssh ] || mkdir /home/${var.user}/.ssh",
            "[ -f /home/${var.user}/.ssh/authorized_keys ] || echo '${file(var.ssh_pubkey)}' > /home/${var.user}/.ssh/authorized_keys",
            "chown -R tboronczyk:tboronczyk /home/${var.user}/.ssh",
            "chmod 700 /home/${var.user}/.ssh",
            "chmod 600 /home/${var.user}/.ssh/authorized_keys"
        ]
    }

    provisioner "local-exec" {
        command = "./generate-inventory.sh > ./ansible-inventory"

        environment {
            USERNAME = "${var.user}"
            DOMAIN = "${var.domain}"
            SSH_PRIVKEY = "${var.ssh_privkey}"
            HOST_IP = "${var.host}"
        }
    }

    provisioner "local-exec" {
        command = "ansible-playbook -i ./ansible-inventory ../ansible/site.yaml"

        environment {
            ANSIBLE_HOST_KEY_CHECKING = "False"
        }
    }
}
