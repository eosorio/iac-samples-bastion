#--- networking/variables.tf

data "aws_availability_zones" "available_azs" {}

variable "vpc_id" {}
variable "vpc_default_route_table_id" {}

variable "subnet_cidrs" {
  type = map(string)
}

variable "instance_bastion1_id" {}
// variable "instance_bastion2_id" {}
// variable "instance_bastion3_id" {}

# Common tags
variable "environment" {}
variable "repo_url" {}
