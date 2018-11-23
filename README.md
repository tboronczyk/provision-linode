# Provisioning

This project uses Terraform and Ansible to provision a web server. Before you
begin, ensure both tools are available locally.

 * Terraform - [www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
 * Ansible - `apt-get ansible` or `pip install ansible`

You will also need a Linode API access key.

## Provisioning the server

Follow these steps to provision the web server.

### Generate a dedicated SSH key pair

  * `ssh-keygen -N "" -f ~/.ssh/$domain` (replace `$domain` with your
    domain name)

### Execute the Terraform script

  * `cd terraform`
  * `cp terraform.tfvars.example terraform.tfvars`
  * Update the values in `terraform.tfvars` accordingly
  * `terraform init`
  * `terraform apply`

### Execute the Ansible playbook

  * `cd ../ansible`
  * `cp hosts.example hosts`
  * update the values in `hosts` accordingly
  * `ansible-playbook site.yaml`

