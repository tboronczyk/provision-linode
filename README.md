## Provisioning

This project uses Terraform and Ansible to provision the web server. Before you
begin, ensure both tools are available locally.

 * Terraform - [www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)
 * Ansible - `apt-get ansible` or `pip install ansible`

You will also need a Linode API key.

## Provision the server

Follow these steps to provision the web server.

  * `cd terraform`
  * `cp terraform.tfvars.example terraform.tfvars`
  * update the values in `terraform.tfvars` accordingly
  * `terraform init`
  * `terraform apply`
  * `ssh -t root@xxx.xxx.xxx.xxx 'apt-get install python'`
  * `cd ../ansible`
  * `cp hosts.example hosts`
  * update the values in `hosts` accordingly
  * `ansible-playbook webserver.yaml`
