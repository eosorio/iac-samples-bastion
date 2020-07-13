#--- tags/outputs.tf

output "environment" {
    value          = var.environment
    description    = "Environment"
}

output "repo_url" {
    value          = var.repo_url
    description    = "Repository to manage this resource"
}

output "service" {
    value          = var.service
    description    = "Service. Used for resources agroupation"
}