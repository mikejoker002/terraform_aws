# terraform_aws
terraform to bring up the stack in aws
## Installing terraform 0.11.13 using install script
Pre-request:
Base image: ubuntu

Run the below command to install teh terrform 
sudo ./terraform_install.sh

## Initilize the aws env information

1. Update the aws credential informaton in aws_initilize file
2. Run the below command to initilize
   source aws_initilize

## Creating the S3 Storage using terraform script
(Moved the variables values to the root variable file. So Update the var.tf files before running the terraform plan )

1. go to the folder storage 
   cd storage
2. Initialize the terraform
   terraform init
3. dry run the terraform script
   terraform plan
4. Apply the terrform storage script
   terraform apply
5. Now the s3 bucket is created in your account.
6. To delete the created storage , run the destroy command
   terraform destroy
   
## Creating the VPC in aws
(Moved the variables values to the root variable file. So Update the var.tf files before running the terraform plan )
1. go to the folder network
   cd network
2. Initialize the terraform
   terraform init
3. Dry run the terraform script
   terraform plan
4. create the VPC by applying the code in terraform
   terraform apply
5. Now the VPC is created in your account.
6. To delete the created VPC , run the destroy command
   terraform destroy
   
## Deploying the ec2 instances in AWS.

1. Initialize the terraform to download the resource packages.
   terraform init
2. Dry run the terraform script
   terraform plan
3. Deploy the Ec2 instance and install the apache in terraform.
   terraform apply
4. Now the Ec2 instance got created .verify it in Ec2 console.
5. Verify the Apache installed by browse the ip address of the deployed instance.
6. We can destroy the complete stack by running below command.
   terraform destroy

   
   
 

