/* EXTERNAL NETWORK, IG, ROUTE TABLE */
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc1.id}"
  tags {
    Name = "internet gw terraform generated"
  }
}
resource "aws_eip" "forNat" {
  vpc      = true
}
resource "aws_nat_gateway" "PublicAZA" {
  allocation_id = "${aws_eip.forNat.id}"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  depends_on = ["aws_internet_gateway.gw"]
  tags {
    Name = "vpc1 NAT"
  }
}
resource "aws_route_table" "public1" {
  vpc_id = "${aws_vpc.vpc1.id}"
  tags {
    Name = "Public"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
  route {
    cidr_block = "${aws_vpc.vpc2.cidr_block}"
    vpc_peering_connection_id = "${var.peering_id}"
  }  
}
resource "aws_route_table" "private1" {
  vpc_id = "${aws_vpc.vpc1.id}"
  tags {
    Name = "Private"
  }
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.PublicAZA.id}"
  }
  route {
    cidr_block = "${aws_vpc.vpc2.cidr_block}"
    vpc_peering_connection_id = "${var.peering_id}"
  }  
}
