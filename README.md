# Provision

This project uses Terraform and Ansible to provision a nano 1G Linode server
hosting web and email services. Before you begin, ensure both tools are
available locally.

 * Terraform - [www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
 * Ansible - `apt-get ansible` or `pip install ansible`

You will also need your Linode API access key.

## Provisioning the server

Execute these commands to provision the server:

  * `cd terraform`
  * `cp terraform.tfvars.example terraform.tfvars`
  * Update the values in `terraform.tfvars` accordingly
  * `terraform init`
  * `terraform apply`

### Notes

The web server must be reachable via DNS for generating SSL/TLS certificates to
succeed. Terraform will create the necessary records but setup will fail if the
records have not propegated yet. If this happens, wait a short while and run
`terraform apply` again.

The root password is randomly generated by Terraform. Protect your `terraform.tfstate`
file as you would any sensitive file.

The primary user account is configured for certificate-based SSH login. However,
you may wish to set a password after the server is provisioned to allow for
recovery/console login.

The password for the primary email address is "password". This should be
changed. To do so, execute the following:

    doveadm pw -s SHA512-CRYPT
    sudo sqlite3 /etc/postfix/accounts.sqlite

    UPDATE users SET password = "{SHA512-CRYPT}xxx" WHERE user = "<username>" AND domain = "<domain>";

Additional email users can be added with: 

    sudo sqlite3 /etc/postfix/accounts.sqlite

    INSERT INTO users VALUES ("<username>", "<domain>", "{SHA512-CRYPT}xxx", "Y");

## What is installed

The following is installed and configured on the provisioned server:

  * Ubuntu (18.04 LTS)
  * Apache (2.4) - mod_header, mod_ssl, and mod_rewrite enabled
  * PHP (7.2) - also Composer
  * MySQL (8.0)
  * Let's Encrypt SSL/TLS certificates
  * Dovecot (2.2)
  * Postfix (3.3)
  * OpenDKIM (2.11)
  * SpamAssassin (3.4)

Configuration achieves A+ in SSL Labs grading as of Nov 28, 2018.

Security audits welcome.
