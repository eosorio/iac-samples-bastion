#--- compute/main.tf

resource "aws_key_pair" "bastions" {
  key_name        = "cloudops"
  public_key      = var.cloudops_public_key
}

data "aws_ami" "amazon-linux2" {
  most_recent     = true
  owners          = ["amazon"]  // 137112412989

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon-linux2.id
  instance_type               = "t2.micro" 
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group_ssh_id]
  subnet_id                   = var.subnet_id["public1"]
  key_name                    = aws_key_pair.bastions.key_name

  tags         = {
    Name          = "bastion1"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }

}