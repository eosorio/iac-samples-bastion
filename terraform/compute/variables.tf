#--- compute/variables.tf

# Common tags
variable "environment" {}
variable "repo_url" {}
variable "service" {}

variable "cloudops_public_key" {}

variable "subnet_id" {
  type = map(string)
}

variable "security_group_ssh_id" {}