#--- root terraform.tfvars
# Common tags
environment                = "staging"
repo_url                   = "https://github.com/eosorio/iac-samples-bastion/terraform"
service                    = "bastion"

vpc_cidr                   = "10.1.0.0/16"
vpc_id                     = ""
vpc_default_route_table_id = ""

# Networking
subnet_cidrs       = {
  public1    = "10.1.0.0/24"
  public2    = "10.1.1.0/24"
  public3    = "10.1.2.0/24"
}

subnet_id     = {
  public1   = ""
  public2   = ""
  public3   = ""
}

security_group_ssh_id      = ""

# Compute
instance_bastion1_id       = ""
instance_bastion2_id       = ""
instance_bastion3_id       = ""
bastion_instance_type      = "t2.micro"

asg_max_size               = 3
asg_min_size               = 1
asg_capacity               = 1

balancer_arn                = ""
