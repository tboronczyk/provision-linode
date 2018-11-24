variable "host" {
    description = "IP address of target host"
}

variable "root_pass" {
    description = "Root password"
}

variable "user" {
    description = "Username for non-root account"
}

variable "ssh_keyfile" {
    description = "Authorized public SSH keyfile for user"
}
