#--------------iam/main.tf---------

resource "aws_iam_instance_profile" "mypro_profile" {
    name = "s3access"
    role = "${aws_iam_role.s3access_role.name}"
}

resource "aws_iam_role_policy" "mypro_policy" {
  name = "s3policy"
  role = "${aws_iam_role.s3access_role.id}"

policy = <<EOF
{
    "Version": "2019-03-18",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "s3access_role" {
    name = "s3access_role"
    assume_role_policy = <<EOF
    {
        "Version": "2019-03-18",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "service": "ec2.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
EOF
}