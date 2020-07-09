# Common tags
environment   = "staging"
repo_url      = "https://github.com/eosorio/iac-samples-bastion/terraform"


vpc_cidr           = "10.1.0.0/16"
subnet_cidrs       = {
    public1    = "10.1.0.1/24"
    public2    = "10.1.0.2/24"
    public3    = "10.1.0.3/24"
}