resource "aws_subnet" "PublicAZA2" {
  provider = "aws.west2"
  vpc_id = "${aws_vpc.vpc2.id}"
  cidr_block = "${var.Subnet-Public-AzA-CIDR2}"
  tags {
    Name = "PublicAZA2"
  }
 availability_zone = "${data.aws_availability_zones.vpc2.names[0]}"
}
resource "aws_route" "primary-internet_access2" {
  provider = "aws.west2"
  route_table_id         = "${aws_vpc.vpc2.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw2.id}"
}
resource "aws_route_table_association" "PublicAZA2" {
  provider = "aws.west2"
  subnet_id = "${aws_subnet.PublicAZA2.id}"
  route_table_id = "${aws_route_table.public2.id}"
}
resource "aws_subnet" "PrivateAZA2" {
  provider = "aws.west2"
  vpc_id = "${aws_vpc.vpc2.id}"
  cidr_block = "${var.Subnet-Private-AzA-CIDR2}"
  tags {
    Name = "PublicAZB2"
  }
  availability_zone = "${data.aws_availability_zones.vpc2.names[1]}"
}
resource "aws_route_table_association" "PrivateAZA2" {
  provider = "aws.west2"
  subnet_id = "${aws_subnet.PrivateAZA2.id}"
  route_table_id = "${aws_route_table.private2.id}"
}