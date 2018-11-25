# Provisioning

This project uses Terraform and Ansible to provision a web server. Before you
begin, ensure both tools are available locally.

 * Terraform - [www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
 * Ansible - `apt-get ansible` or `pip install ansible`

You will also need a Linode API access key.

## Provisioning the server

Follow these steps to provision the web server.

  * `cd terraform`
  * `cp terraform.tfvars.example terraform.tfvars`
  * Update the values in `terraform.tfvars` accordingly
  * `terraform init`
  * `terraform apply`
