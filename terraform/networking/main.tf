#--- networking/main.tf

resource "aws_subnet" "bastion_public_subnet1" {
    vpc_id                  = var.vpc_id
    cidr_block              = var.subnet_cidrs["public1"]
    map_public_ip_on_launch = true
    availability_zone       = data.aws_availability_zones.available_azs.names[0]

    tags = {
        Name =       "public1"
        Environment   = var.environment
        IaCRepo       = var.repo_url
    }
}
