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

resource "aws_subnet" "bastion_public_subnet2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidrs["public2"]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available_azs.names[1]

  tags = {
    Name          = "public2"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

resource "aws_subnet" "bastion_public_subnet3" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidrs["public3"]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available_azs.names[2]

  tags = {
    Name          = "public3"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

resource "aws_security_group" "public_ssh" {
  name            = "public_ssh"
  description     = "Allow SSH from outside the VPC"
  vpc_id          = var.vpc_id

  ingress         {
    description   = "Allow SSH connections from every place"
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  egress          {
    from_port     = 0
    to_port       = 0
    protocol      = "-1"
    cidr_blocks   = ["0.0.0.0/0"]
  }

  tags         = {
    Name          = "public_ssh"
    Environment   = var.environment
    IaCRepo       = var.repo_url
  }
}

# Subnet associations
resource "aws_route_table_association" "bastion_public1" {
  subnet_id      = aws_subnet.bastion_public_subnet1.id
  route_table_id = aws_route_table.staging_public_rt.id
}

resource "aws_route_table_association" "bastion_public2" {
  subnet_id      = aws_subnet.bastion_public_subnet2.id
  route_table_id = aws_route_table.staging_public_rt.id
}

resource "aws_route_table_association" "bastion_public3" {
  subnet_id      = aws_subnet.bastion_public_subnet3.id
  route_table_id = aws_route_table.staging_public_rt.id
}
