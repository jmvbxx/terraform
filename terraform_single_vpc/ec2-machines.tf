resource "aws_instance" "frontend" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.frontend.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "frontend"
  }
  connection {
#    type        = "ssh"
#    agent       = false
    private_key = "${file("~/.ssh/deployer-east2.pem")}"
    user        = "ec2-user"
  }  
  provisioner "remote-exec" {
    inline = [
      "touch /tmp/worked"
    ]
  }
}

resource "aws_instance" "backend" {
  ami           = "${lookup(var.AmiLinux, var.region)}"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.backend.id}"]
  key_name = "${var.key_name}"
  tags {
        Name = "backend"
  }
}