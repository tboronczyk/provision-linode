variable "host" {
    description = "IP address of target host"
}

variable "root_pass" {
    description = "Root password"
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
