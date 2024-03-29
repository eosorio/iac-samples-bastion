#--- root main.tf

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# If you want to create a new VPC, use the above resource block; else use a data block instead
resource "aws_vpc" "demo_vpc" {
    cidr_block            = var.vpc_cidr
    enable_dns_hostnames  = true
    enable_dns_support    = true

    tags = {
        Name          = "demo_vpc"
        Environment   = module.tags.environment
        IaCRepo       = module.tags.repo_url
    }
}

module "tags" {
  source              = "./tags"

  repo_url            = var.repo_url
  environment         = var.environment
  service             = var.service
}

module "networking" {
  source                       = "./networking"
  environment                  = module.tags.environment
  repo_url                     = module.tags.repo_url

  vpc_id                       = aws_vpc.demo_vpc.id
  vpc_default_route_table_id   = aws_vpc.demo_vpc.default_route_table_id
  subnet_cidrs                 = var.subnet_cidrs

  instance_bastion1_id         = module.compute.instance_bastion1_id
  security_group_ssh_id        = var.security_group_ssh_id
}

module "compute" {
  source                 = "./compute"
  environment            = module.tags.environment
  repo_url               = module.tags.repo_url
  service                = module.tags.service

  key_name               = var.key_name

  vpc_id                 = aws_vpc.demo_vpc.id
  subnet_id              = {
    public1    = module.networking.subnet_public1_id
  }

  instance_bastion1_id   = var.instance_bastion1_id

  bastion_instance_type  = var.bastion_instance_type

  asg_max_size           = var.asg_max_size
  asg_min_size           = var.asg_min_size
  asg_capacity           = var.asg_capacity
  balancer_arn           = module.networking.balancer_arn
}