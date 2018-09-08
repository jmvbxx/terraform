provider "aws" {
#  region     = "us-west-1"
  region     = "us-east-2"
}

provider "aws" {
  alias      = "west2"
  region     = "us-west-2"
}

data "aws_availability_zones" "vpc1"  {}

data "aws_availability_zones" "vpc2" {
  provider = "aws.west2"
}

resource "aws_vpc" "vpc1" {
  cidr_block = "${var.vpc-fullcidr}"
  #### this 2 true values are for use the internal vpc dns resolution
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
    Name = "VPC 1"
  }
}
