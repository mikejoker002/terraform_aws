provider "aws" {}

# deploy storage Resource
module "storage" {
    source = "./storage"
    s3_name = "${var.s3_name}"
}

#network
module "network" {
    source = "./network"
    vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip     = "${var.accessip}"
}

#compute
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