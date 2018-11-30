variable "linode_token" {
    description = "Linode API access token"
}

variable "domain" {
    description = "Domain name to configure"
}

variable "username" {
    description = "Username for primary user account"
}

variable "ssh_privkey" {
    description = "Private SSH keyfile for user account"
}

variable "ssh_pubkey" {
    description = "Public SSH keyfile for user account"
}

resource "random_string" "password" {
    length = 16
    special = true
    override_special = "/@\" "
}
