terraform {
  backend "s3" {
    bucket                 = "tf-state-eosorio-staging-991637"
    dynamodb_table         = "terraform-state-lock-dynamo"
    key                    = "terraform/terraform-bastion_demo.tfstate"
    region                 = "us-east-1"
  }
}
