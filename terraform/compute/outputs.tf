output "key_pair" {
  value       = var.cloudops_public_key
  description = "Bastion public key"
}

output "instance_bastion1_id" {
  value       = aws_instance.bastion1.id
  description = "ID of bastion2 instance"
}

output "instance_bastion2_id" {
  value       = aws_instance.bastion2.id
  description = "ID of bastion2 instance"
}

output "instance_bastion3_id" {
  value       = aws_instance.bastion3.id
  description = "ID of bastion2 instance"
}