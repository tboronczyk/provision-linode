variable "linode_token" {
    description = "Linode API key"
}

variable "domain" {
    description = "Domain name to configure"
}

variable "authorized_keys" {
    description = "Authorized public SSH keys"
}

variable "root_pass" {
    description = "Password for root login"
}
