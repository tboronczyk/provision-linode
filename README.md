# Provisioning

This project uses Terraform and Ansible to provision a Linode web server.
Before you begin, ensure both tools are available locally.

 * Terraform - [www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
 * Ansible - `apt-get ansible` or `pip install ansible`

You will also need a Linode API access key.

## Provisioning the server

Execute these commands to provision a web server.

  * `cd terraform`
  * `cp terraform.tfvars.example terraform.tfvars`
  * Update the values in `terraform.tfvars` accordingly
  * `terraform init`
  * `terraform apply`

**Note:** The web server must be reachable via DNS for generating SSL/TLS
certificates to succeed. Terraform will create the necessary records but setup
will fail if the records have not propegated yet. If this happens, wait a short
while and run `terraform apply` again.
