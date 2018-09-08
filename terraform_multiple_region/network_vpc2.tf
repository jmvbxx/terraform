resource "aws_vpc" "vpc2" {
  provider = "aws.west2"
  cidr_block = "${var.vpc2-fullcidr}"
  #### this 2 true values are for use the internal vpc dns resolution
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "VPC 2"
  }
}
