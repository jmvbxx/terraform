resource "aws_security_group" "FrontEnd2" {
  provider = "aws.west2"
  name = "FrontEnd"
  tags {
    Name = "FrontEnd"
  }
  description = "ONLY HTTP CONNECTION INBOUND"
  vpc_id = "${aws_vpc.vpc2.id}"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Database2" {
  provider = "aws.west2"
  name = "Database"
  tags {
    Name = "Database"
  }
  description = "ONLY tcp CONNECTION INBOUND"
  vpc_id = "${aws_vpc.vpc2.id}"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8
    to_port = 0
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}