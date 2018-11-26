output "setup_dkim_key" {
    value = "${data.local_file.dkim_key.content}"
}
