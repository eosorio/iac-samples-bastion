output "subnet_cidr_public1" {
  value = var.subnet_cidrs["public1"]
}

output "subnet_public1_id" {
  value = aws_subnet.bastion_public_subnet1.id
}

output "security_group_ssh_id" {
  value = var.security_group_ssh_id
}

output "balancer_arn" {
  value = aws_lb.bastion_balancer.arn
}