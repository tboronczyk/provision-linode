resource "linode_domain_record" "txt-domainkey" {
    domain_id = "${var.domain_id}"
    record_type = "TXT"
    name = "mail._domainkey"
    target = "${var.dkim_value}"
}
