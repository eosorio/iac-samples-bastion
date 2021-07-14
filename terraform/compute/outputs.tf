output "key_pair" {
  value       = var.key_name
  description = "Bastion key pair"
}

output "instance_bastion1_id" {
  value       = aws_instance.bastion1.id
  description = "ID of bastion2 instance"
}
