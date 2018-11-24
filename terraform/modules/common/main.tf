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

            # create non-root user account
            "useradd -m -s /bin/bash ${var.user}",
            "usermod -a -G sudo ${var.user}",
            "echo '${var.user} ALL = NOPASSWD : ALL' > /etc/sudoers.d/${var.user}",

            # upload SSH key for login
            "mkdir /home/${var.user}/.ssh",
            "echo '${file(var.ssh_keyfile)}' > /home/${var.user}/.ssh/authorized_keys",
            "chown -R tboronczyk:tboronczyk /home/${var.user}/.ssh",
            "chmod 700 /home/${var.user}/.ssh",
            "chmod 600 /home/${var.user}/.ssh/authorized_keys"
        ]
    }
}
