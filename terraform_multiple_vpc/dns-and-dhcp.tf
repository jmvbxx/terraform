##
#  VPC 1
resource "aws_vpc_dhcp_options" "mydhcp" {
    domain_name = "${var.DnsZoneName}"
    domain_name_servers = ["AmazonProvidedDNS"]
    tags {
      Name = "My internal name"
    }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
    vpc_id = "${aws_vpc.vpc1.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp.id}"
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main" {
  name = "${var.DnsZoneName}"
  vpc_id = "${aws_vpc.vpc1.id}"
  comment = "Managed by terraform"
}

resource "aws_route53_record" "database" {
   zone_id = "${aws_route53_zone.main.zone_id}"
   name = "mydatabase.${var.DnsZoneName}"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.database.private_ip}"]
}
#  End VPC 1
##

##
#  VPC 2
resource "aws_vpc_dhcp_options" "mydhcp2" {
    domain_name = "${var.DnsZoneName2}"
    domain_name_servers = ["AmazonProvidedDNS"]
    tags {
      Name = "My internal name"
    }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver2" {
    vpc_id = "${aws_vpc.vpc2.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.mydhcp2.id}"
}

/* DNS PART ZONE AND RECORDS */
resource "aws_route53_zone" "main2" {
  name = "${var.DnsZoneName2}"
  vpc_id = "${aws_vpc.vpc2.id}"
  comment = "Managed by terraform"
}

resource "aws_route53_record" "database2" {
   zone_id = "${aws_route53_zone.main.zone_id}"
   name = "mydatabase.${var.DnsZoneName2}"
   type = "A"
   ttl = "300"
   records = ["${aws_instance.database2.private_ip}"]
}
#  End VPC 2
##