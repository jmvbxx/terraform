/* EXTERNAL NETWORK, IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw2" {
  provider = "aws.west2"
  vpc_id = "${aws_vpc.vpc2.id}"
  tags {
      Name = "internet gw terraform generated"
  }
}
resource "aws_eip" "forNat2" {
  provider = "aws.west2"
  vpc      = true
}
resource "aws_nat_gateway" "PublicAZA2" {
  provider = "aws.west2"
  allocation_id = "${aws_eip.forNat2.id}"
  subnet_id = "${aws_subnet.PublicAZA2.id}"
  depends_on = ["aws_internet_gateway.gw2"]
  tags {
    Name = "vpc2 NAT"
  }
}
resource "aws_route_table" "public2" {
  provider = "aws.west2"
  vpc_id = "${aws_vpc.vpc2.id}"
  tags {
    Name = "Public"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw2.id}"
  }
  route {
    cidr_block = "${aws_vpc.vpc1.cidr_block}"
    vpc_peering_connection_id = "${var.peering_id}"
  }  
}
resource "aws_route_table" "private2" {
  provider = "aws.west2"
  vpc_id = "${aws_vpc.vpc2.id}"
  tags {
    Name = "Private"
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.PublicAZA2.id}"
  }
  route {
    cidr_block = "${aws_vpc.vpc1.cidr_block}"
    vpc_peering_connection_id = "${var.peering_id}"
  }  
}
