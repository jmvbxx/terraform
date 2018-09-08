resource "aws_subnet" "PublicAZA" {
  vpc_id = "${aws_vpc.vpc1.id}"
  cidr_block = "${var.Subnet-Public-AzA-CIDR}"
  tags {
    Name = "PublicAZA"
  }
 availability_zone = "${data.aws_availability_zones.vpc1.names[0]}"
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
  availability_zone = "${data.aws_availability_zones.vpc1.names[1]}"
}
resource "aws_route_table_association" "PrivateAZA" {
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  route_table_id = "${aws_route_table.private1.id}"
}