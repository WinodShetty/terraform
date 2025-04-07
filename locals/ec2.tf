resource "aws_instance" "this" {
  ami                    = local.ami_id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #instance_type          = var.instance_type
  instance_type = local.instance_type
  tags = {
    # expense-dev-backend
    Name    = local.name
    Purpose = "terraform-practice"
  }
}

