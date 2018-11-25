variable "linode_token" {
    description = "Linode API access token"
}

variable "domain" {
    description = "Domain name to configure"
}

variable "user" {
    description = "Username for non-root account"
}

variable "ssh_privkey" {
    description = "Private SSH keyfile for user"
}

variable "ssh_pubkey" {
    description = "Public SSH keyfile for user"
}

resource "random_string" "password" {
    length = 16
    special = true
    override_special = "/@\" "
}
