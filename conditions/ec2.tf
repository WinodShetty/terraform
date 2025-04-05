resource "aws_instance" "this" {
  ami                    = var.ami_id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = var.environment == "prod" ? "t3.small" : "t3.micro"
  tags = var.ec2_tags
}
