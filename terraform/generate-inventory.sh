#! /bin/bash

cat <<EOF
all:
  vars:
    username: $USERNAME
    domain: $DOMAIN
    ansible_ssh_user: $USERNAME
    ansible_private_key_file: $SSH_PRIVKEY
  children:
    databases:
      hosts:
        db:
          ansible_host: $HOST_IP
    webservers:
      hosts:
        www:
          ansible_host: $HOST_IP
    mailservers:
      hosts:
        mail:
          ansible_host: $HOST_IP
EOF

