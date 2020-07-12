#--- root main.tf

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

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
  source         = "./tags"

  repo_url       = var.repo_url
  environment    = var.environment
}

module "networking" {
    source       = "./networking"
    environment  = module.tags.environment
    repo_url     = module.tags.repo_url

    vpc_id       = aws_vpc.demo_vpc.id
    subnet_cidrs = var.subnet_cidrs
}