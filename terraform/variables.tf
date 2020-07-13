#--- root variables.tf
variable "environment" {}
variable "repo_url" {}

variable "aws_profile" {}
variable "aws_shared_credentials_file" {}
variable "aws_region" {}

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

# Compute
variable "cloudops_public_key" {}

