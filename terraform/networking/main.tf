#--- networking/main.tf

resource "aws_internet_gateway" "staging_igw" {
  vpc_id      = var.vpc_id

  tags   = {
    Name          = "staging_igw"
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
    Name =       "public1"
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
