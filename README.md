# Provision

This project provisions a nano 1G Linode server for hosting basic web and email
services.

Before you begin, ensure both Terraform and Ansible are installed locally.

 * Terraform - [www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
 * Ansible - `apt-get ansible` or `pip install ansible`

You will also need a [Linode API access key](https://www.linode.com/docs/platform/api/getting-started-with-the-linode-api-new-manager/#get-an-access-token).

## Provisioning the server

Generate SSH keypairs for the root and primary user accounts:

  * ssh-keygen -N "" -C root@example.com -f keys/example-root
  * ssh-keygen -N "" -C user@example.com -f keys/example-user

Then execute these commands to provision the server:

  * `cd terraform`
  * `cp terraform.tfvars.example terraform.tfvars`
  * Update the values in `terraform.tfvars` accordingly
  * `terraform init`
  * `terraform apply`

The server must be reachable via DNS for generating SSL/TLS certificates to
succeed. Terraform will create the necessary records but setup will fail if
these records have not propegated yet. If this happens, wait a short while and
run `terraform apply` again.

## Post-provisioning

The primary user account is configured for certificate-based SSH login. You
may wish to set a password once the server is provisioned to allow for
recovery/console login.

The password for the primary email address is "password". Execute the following
to change it:

    doveadm pw -s SHA512-CRYPT
    sudo sqlite3 /etc/postfix/accounts.sqlite

    UPDATE users SET password = "{SHA512-CRYPT}xxx" WHERE user = "<username>" AND domain = "<domain>";

Additional email users can be added with: 

    INSERT INTO users VALUES ("<username>", "<domain>", "{SHA512-CRYPT}xxx", "Y");

## What's installed

  * Ubuntu (18.04 LTS)
  * Apache (2.4) - mod_header, mod_ssl, and mod_rewrite enabled
  * PHP (7.2) - also Composer
  * MySQL (8.0)
  * Let's Encrypt SSL/TLS certificates
  * Dovecot (2.2)
  * Postfix (3.3)
  * OpenDKIM (2.11)
  * SpamAssassin (3.4)

Apache configuration scores A+ in SSL Labs grading as of Nov 28, 2018.

Security audits are welcome.
