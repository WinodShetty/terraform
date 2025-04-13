resource "aws_instance" "terraform_sample" {
  ami = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.win.id]
  instance_type = "t3.micro"
  tags = {
    name = "terraform-demo"
    purpose = "terraform-practice"
  }
}

resource "aws_security_group" "win" {
  name = "win"
  description = "allow TLS inbound traffic and all out bound traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "win_terraform"
  }
}