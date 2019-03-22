#########---------------network/main.tf-----

data "aws_availability_zones" "available" {}

#VPC
resource "aws_vpc" "tf_mypro_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags {
        Name = "tf_mypro_vpc"
    }
}

#Internet gateway
resource "aws_internet_gateway" "tf_mypro_net_gw" {
    vpc_id = "${aws_vpc.tf_mypro_vpc.id}"

    tags {
        Name = "tf_mypro_igw"
    }
}

#Route Public
resource "aws_route_table" "tf_mypro_pub_rt" {
    vpc_id = "${aws_vpc.tf_mypro_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.tf_mypro_net_gw.id}"
    }

    tags {
        Name = "tf_mypro_pub"
    }
    }

#Private
resource "aws_default_route_table" "tf_mypro_priv_rt" {
    default_route_table_id = "${aws_vpc.tf_mypro_vpc.default_route_table_id}"

    tags {
        Name = "tf_mypro_priv"
   }
}

#Subnets

resource "aws_subnet" "tf_mypro_public_subnet" {
  count                   = 2
  vpc_id                  = "${aws_vpc.tf_mypro_vpc.id}"
  cidr_block              = "${var.public_cidrs[count.index]}"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"

  tags {
    Name = "tf_mypro_public_${count.index + 1}"
  }
}

resource "aws_route_table_association" "tf_mypro_public_assoc" {
  count = "${aws_subnet.tf_mypro_public_subnet.count}"
  subnet_id      = "${aws_subnet.tf_mypro_public_subnet.*.id[count.index]}"
  route_table_id = "${aws_route_table.tf_mypro_pub_rt.id}"
}

resource "aws_security_group" "tf_mypro_public_sg" {
  name        = "tf_mypro_public_sg"
  description = "Used for access the public instances"
  vpc_id      = "${aws_vpc.tf_mypro_vpc.id}"

  #SSH

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }

  #HTTP

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.accessip}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

