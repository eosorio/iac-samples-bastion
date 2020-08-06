#--- root variables.tf

# Common tags
variable "environment" {}
variable "repo_url" {}
variable "service" {}

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
variable "cloudops_public_key" {}
variable "instance_bastion1_id" {}
variable "instance_bastion2_id" {}
variable "instance_bastion3_id" {}
variable "bastion_instance_type" {}

variable "asg_max_size" {}  
variable "asg_min_size" {}
variable "asg_capacity" {}
variable "balancer_arn" {}