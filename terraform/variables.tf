#--- root variables.tf

# Common tags
variable "environment" {
  description     = "Environment to deploy"
  type            = string
}

variable "repo_url" {
  description     = "IaC source repo"
  type            = string
}

variable "service" {
  description     = "Service to which operation costs will be billed"
  type            = string
}

# AWS environment
variable "aws_profile" {}
variable "aws_shared_credentials_file" {}
variable "aws_region" {}

# VPC
variable "vpc_cidr" {}
variable "vpc_id" {}
variable "vpc_default_route_table_id" {}

# Networking
variable "subnet_cidrs" {
    type = map(string)
}
variable "subnet_id" {
  type = map(string)
}
variable "security_group_ssh_id" {}

# Compute
variable "cloudops_public_key" {
  description      = "SSH public key content (it starts with ssh-rsa)"
  type             = string
}

variable "instance_bastion1_id" {}
variable "bastion_instance_type" {}

variable "asg_max_size" {}  
variable "asg_min_size" {}
variable "asg_capacity" {}
variable "balancer_arn" {}