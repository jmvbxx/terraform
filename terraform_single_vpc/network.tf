##
#  General
provider "aws" {
#  access_key = "${var.aws_access_key}"
#  secret_key = "${var.aws_secret_key}"
  region     = "${var.region}"
}
#  End General
##

##
#  VPC 1
resource "aws_vpc" "vpc1" {
    cidr_block = "${var.vpc-fullcidr}"
   #### this 2 true values are for use the internal vpc dns resolution
    enable_dns_support = true
    enable_dns_hostnames = true
    tags {
      Name = "VPC 1"
    }
}
#  End VPC 1
##
