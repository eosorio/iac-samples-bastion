#--- networking/main.tf

resource "aws_internet_gateway" "staging_igw" {
  vpc_id      = var.vpc_id

  tags   = {
    Name          = "staging_igw"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

# Route tables

resource "aws_default_route_table" "staging_private_rt" {
  default_route_table_id  = var.vpc_default_route_table_id

  tags = {
    Name          = "staging_private"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

resource "aws_route_table" "staging_public_rt" {
  vpc_id         = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging_igw.id
  }

  tags  = {
    Name          = "staging_public"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

# Subnets

resource "aws_subnet" "bastion_public_subnet1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidrs["public1"]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available_azs.names[0]

  tags = {
    Name          = "public1"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

# Subnet associations
resource "aws_route_table_association" "bastion_public1" {
  subnet_id      = aws_subnet.bastion_public_subnet1.id
  route_table_id = aws_route_table.staging_public_rt.id
}


# Balancer

resource "aws_lb" "bastion_balancer" {
  name                = "bastions"
  load_balancer_type  = "network"

  subnets             = [
    aws_subnet.bastion_public_subnet1.id,  
  ]

  tags         = {
    Name          = "bastion_lb"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

resource "aws_lb_target_group" "ssh_bastions" {
  name        = "bastions-lb-tg"
  port        = 22
  protocol    = "TCP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    enabled           = true
    port              = 22
    protocol          = "TCP"
    healthy_threshold = 3
  }
}

resource "aws_lb_listener" "public_ssh" {
  load_balancer_arn    = aws_lb.bastion_balancer.arn
  port                 = 22
  protocol             = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ssh_bastions.arn
  }
}

resource "aws_lb_target_group_attachment" "bastion1" {
  target_group_arn = aws_lb_target_group.ssh_bastions.arn
  target_id        = var.instance_bastion1_id
  port             = 22
}
