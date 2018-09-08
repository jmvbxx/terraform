##
#  VPC 1
resource "aws_subnet" "PublicAZA" {
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "${var.Subnet-Public-AzA-CIDR}"
  tags {
        Name = "PublicAZA"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route" "primary-internet_access1" {
  route_table_id         = "${aws_vpc.vpc1.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
}
resource "aws_route_table_association" "PublicAZA" {
    subnet_id = "${aws_subnet.PublicAZA.id}"
    route_table_id = "${aws_route_table.public1.id}"
}
resource "aws_subnet" "PrivateAZA" {
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "${var.Subnet-Private-AzA-CIDR}"
  tags {
        Name = "PublicAZB"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "PrivateAZA" {
    subnet_id = "${aws_subnet.PrivateAZA.id}"
    route_table_id = "${aws_route_table.private1.id}"
}
#  End VPC 1
##

##
#  VPC 2
resource "aws_subnet" "PublicAZA2" {
  vpc_id = "${aws_vpc.vpc2.id}"
  cidr_block = "${var.Subnet-Public-AzA-CIDR2}"
  tags {
        Name = "PublicAZA2"
  }
 availability_zone = "${data.aws_availability_zones.available.names[0]}"
}
resource "aws_route" "primary-internet_access2" {
  route_table_id         = "${aws_vpc.vpc2.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw2.id}"
}
resource "aws_route_table_association" "PublicAZA2" {
    subnet_id = "${aws_subnet.PublicAZA2.id}"
    route_table_id = "${aws_route_table.public2.id}"
}
resource "aws_subnet" "PrivateAZA2" {
  vpc_id = "${aws_vpc.vpc2.id}"
  cidr_block = "${var.Subnet-Private-AzA-CIDR2}"
  tags {
        Name = "PublicAZB2"
  }
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
}
resource "aws_route_table_association" "PrivateAZA2" {
    subnet_id = "${aws_subnet.PrivateAZA2.id}"
    route_table_id = "${aws_route_table.private2.id}"
}
#  End VPC 2
##