#------------------- storage/main.tf ------------------

# aws creds

provider "aws" {}

# create a random ID

resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

# create the bucket

resource "aws_s3_bucket" "tf_code" {
    bucket = "${var.s3_name}-${random_id.tf_bucket_id.dec}"
    acl    = "private"
    force_destroy = true

    tags {

       Name = "tf_bucket"
     }
}

# Deploy Networking Resources

module "network" {
  source       = "./network"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip     = "${var.accessip}"
}

# Deploy Compute Resources

module "compute" {
  source          = "./compute"
  instance_count  = "${var.instance_count}"
  key_name        = "${var.key_name}"
  public_key_path = "${var.public_key_path}"
  instance_type   = "${var.server_instance_type}"
  subnets         = "${module.networking.public_subnets}"
  security_group  = "${module.networking.public_sg}"
  subnet_ips      = "${module.networking.subnet_ips}"
}