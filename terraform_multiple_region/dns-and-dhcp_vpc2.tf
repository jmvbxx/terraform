resource "aws_vpc_dhcp_options" "mydhcp2" {
  provider = "aws.west2"
  domain_name = "${var.DnsZoneName2}"
  domain_name_servers = ["AmazonProvidedDNS"]
}

resource "aws_vpc_dhcp_options_association" "dns_resolver2" {
  provider = "aws.west2"
  vpc_id = "${aws_vpc.vpc2.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp2.id}"
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main2" {
  provider = "aws.west2"
  name = "${var.DnsZoneName2}"
  vpc_id = "${aws_vpc.vpc2.id}"
  comment = "Managed by terraform"
}

resource "aws_route53_record" "database2" {
  provider = "aws.west2"
  zone_id = "${aws_route53_zone.main.zone_id}"
  name = "mydatabase.${var.DnsZoneName2}"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.database2.private_ip}"]
}