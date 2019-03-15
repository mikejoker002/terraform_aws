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
