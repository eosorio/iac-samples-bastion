provider "aws" {
}

resource "aws_vpc" "demo_vpc" {
    cidr_block            = var.vpc_cidr
    enable_dns_hostnames  = true
    enable_dns_support    = true

    tags = {
        Name          = "demo_vpc"
        Environment   = var.environment
        IaCRepo       = var.repo_url
    }
}