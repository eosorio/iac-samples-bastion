# iac-samples-bastion
Infrastructure as Code Sample: Bastion hosts

These are sample files for setting up a High Availabilty Cluster for bastion Linux servers on AWS. The HA is achieved by using three AZs on one single region and having one EC2 instance running per each AZ.

There is a load balancer which checks the health of every instance and routes the SSH requests to a healthy EC2 instance. If this load balancer is registered to a DNS record it would be user friendlier, having the user to connect to bastion.mydomain.com:22 and a healthy EC2 instance will take the connection request.

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
