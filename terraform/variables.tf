#--- root variables.tf
variable "environment" {}
variable "repo_url" {}

variable "aws_profile" {}
variable "aws_shared_credentials_file" {}

variable "vpc_cidr" {}
variable "subnet_cidrs" {
    type = map
}
