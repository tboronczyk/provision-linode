variable "host" {
    description = "IP address of target host"
}

variable "domain" {
    description = "Domain name to configure"
}

variable "username" {
    description = "Username for primary user account"
}

variable "root_ssh_privkey" {
    description = "Private SSH keyfile for root account"
}

variable "user_ssh_privkey" {
    description = "Private SSH keyfile for user account"
}

variable "user_ssh_pubkey" {
    description = "Public SSH keyfile for user account"
}
