# iac-samples-bastion
Infrastructure as Code Sample: Bastion hosts

These are sample files for setting up a High Availabilty Cluster for bastion Linux servers on AWS. The HA is achieved by using an Auto Scaling Group git a minimum size of 1 and desired size of 1 instance.

If the ASG detects the instance is unhealthy, it will replace it immediately. It is highly recommended that you use a custom AMI instead the Amazon Linux AMI used in this sample, to follow the concept of immutable infrastructure.

Soon I will be creating another repository to create a customized AMI using Hashicorp Packer.

## Deploying
### In Terraform
* Set your AWS_PROFILE env variable
* Set your AWS keys for that profile
* Fill the values on awsprofile.tfvars
* Export the SSH public key as the cloudops_public_key TF variable:
```
export TF_VAR_cloudops_public_key=$(cat ~/.ssh/id_rsa.pub)
```
* Terraform plan/apply
```
terraform plan -var-file=awsprofile.tfvars
```
