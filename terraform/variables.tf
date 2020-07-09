#--- root variables.tf
variable "environment" {}
variable "repo_url" {}

variable "vpc_cidr" {}
variable "subnet_cidrs" {
    type = map
}
