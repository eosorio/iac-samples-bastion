#--- compute/variables.tf

# Common tags
variable "environment" {}
variable "repo_url" {}
variable "service" {}

variable "key_name" {}

variable "vpc_id" {}

variable "subnet_id" {
  type = map(string)
}

# Replaced by public SSH module
//variable "security_group_ssh_id" {}

variable "instance_bastion1_id" {}

variable "bastion_instance_type" {}
variable "asg_max_size" {}  
variable "asg_min_size" {}
variable "asg_capacity" {}
variable "balancer_arn" {}