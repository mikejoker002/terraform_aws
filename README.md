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
   
 

