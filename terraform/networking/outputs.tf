output "subnet_cidr_public1" {
  value = var.subnet_cidrs["public1"]
}

output "subnet_public1_id" {
  value = aws_subnet.bastion_public_subnet1.id
}

// output "subnet_public2_id" {
//   value = aws_subnet.bastion_public_subnet2.id
// }

// output "subnet_public3_id" {
//   value = aws_subnet.bastion_public_subnet3.id
// }
