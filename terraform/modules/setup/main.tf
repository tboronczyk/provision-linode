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
            "id -u ${var.username} || useradd -m -s /bin/bash ${var.username}",
            "groups ${var.username} | grep -q sudo || usermod -a -G sudo ${var.username}",
            "[ -f /etc/sudoers.d/${var.username} ] || echo '${var.username} ALL = NOPASSWD : ALL' > /etc/sudoers.d/${var.username}",
            "[ -d /home/${var.username}/.ssh ] || mkdir /home/${var.username}/.ssh",
            "[ -f /home/${var.username}/.ssh/authorized_keys ] || echo '${file(var.ssh_pubkey)}' > /home/${var.username}/.ssh/authorized_keys",
            "chown -R ${var.username}:${var.username} /home/${var.username}/.ssh",
            "chmod 700 /home/${var.username}/.ssh",
            "chmod 600 /home/${var.username}/.ssh/authorized_keys"
        ]
    }
}

resource "null_resource" "ansible" {
    depends_on = ["null_resource.setup"]

    provisioner "local-exec" {
        command = "./generate-inventory.sh > ./ansible-inventory"

        environment {
            USERNAME = "${var.username}"
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

data "local_file" "dkim_key" {
    depends_on = ["null_resource.ansible"]
    filename = "mail.dkim-value"
}
