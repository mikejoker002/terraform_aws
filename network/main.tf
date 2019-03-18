#---------------network/main.tf-----

data "aws_availability_zones" "available" {}

resource "aws_vpc" "tf_mypro_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags {
        Name = "tf_mypro_vpc"
    }
}

resource "aws_internet_gateway" "tf_mypro_net_gw" {
    vpc_id = "${aws_vpc.tf_mypro_vpc.id}"

    tags {
        Name = "tf_mypro_igw"
    }
}

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

resource "aws_default_route_table" "tf_mypro_priv_rt" {
    default_route_table_id = "${aws_vpc.tf_mypro_vpc.default_route_table_id}"

    tags {
        Name = "tf_mypro_priv"
   }
}