aws_region = "ap-south-1"

s3_name    = "my-terratum"
project_name = "mytest"

vpc_cidr = "10.168.0.0/16"
public_cidrs = [
    "10.168.1.0/24",
    "10.168.2.0/24"
    ]
accessip = "0.0.0.0/0"

key_name = "tf_key" 
public_key_path = "/home/adhi/.ssh/id_rsa.pub"
server_instance_type = "t2.micro" 
instance_count = 2
