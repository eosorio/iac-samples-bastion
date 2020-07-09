#--- networking/main.tf

# resource "aws_subnet" "bastion_public_subnet1" {
#     vpc_id                  = aws_vpc.demo_vpc.id
#     cidr_block              = var.cidrs["public1"]
#     map_public_ip_on_launch = true
#     availability_zone       = data.aws_availability_zones.available_azs.names[0]

#     tags = {
#         Name =       "public1"
#         Environment   = var.environment
#         IaCRepo       = var.repo_url
#     }
# }