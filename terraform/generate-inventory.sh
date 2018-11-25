#! /bin/bash

cat <<EOF
all:
  vars:
    myusername: $USERNAME
    mydomain: $DOMAIN
    ansible_ssh_user: $USERNAME
    ansible_private_keyfile: $SSH_PRIVKEY
  children:
    webservers:
      hosts:
        www:
          ansible_host: $HOST_IP
    mailservers:
      hosts:
        mail:
          ansible_host: $HOST_IP
EOF
