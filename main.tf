provider "aws" {}

# deploy storage Resource
module "storage" {
    source = "./storage"
    s3_name = "${var.s3_name}"
}