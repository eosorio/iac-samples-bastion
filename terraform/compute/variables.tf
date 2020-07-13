#--- compute/variables.tf

# Common tags
variable "environment" {}
variable "repo_url" {}

variable "cloudops_public_key" {}

variable "subnet_id" {
  type = map(string)
}
