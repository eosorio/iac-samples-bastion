#--- compute/main.tf

data "aws_ami" "amazon-linux2" {
  most_recent     = true
  owners          = ["amazon"]  // 137112412989

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*x86_64-gp2"]
  }
}

resource "aws_instance" "bastion1" {
  ami                         = data.aws_ami.amazon-linux2.id
  instance_type               = "t2.micro" 
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.security_group_ssh_id]
  subnet_id                   = var.subnet_id["public1"]
  key_name                    = var.key_name

  tags         = {
    Name          = "bastion1"
    Environment   = var.environment
    IaCRepo       = var.repo_url
    Service       = "bastion"
  }
}

# ASG and Launch Template

resource "aws_launch_template" "bastions_template" {
  name_prefix       = "bastion"
  image_id          = data.aws_ami.amazon-linux2.id
  instance_type     = var.bastion_instance_type
}

resource "aws_autoscaling_group" "bastions_asg" {
  name                = "asg-${aws_launch_template.bastions_template.name_prefix}"
  max_size            = var.asg_max_size
  min_size            = var.asg_min_size
  desired_capacity    = var.asg_capacity
  #target_group_arns   = [var.balancer_arn]
  vpc_zone_identifier = [
                        var.subnet_id["public1"], 
                        var.subnet_id["public2"],
                        var.subnet_id["public3"],
                        ]

  launch_template {
    id             = aws_launch_template.bastions_template.id
    version        = "$Latest"
  }
}
