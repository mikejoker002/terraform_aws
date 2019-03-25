#### ----------storage/output.tf---------------- ########

output "Bucket Name" {
   value = "${module.storage.bucketname}"
}

#### ----------- network/output.tf -------------####

output "Public Subnets" {
  value = "${join(", ", module.network.public_subnets)}"
}

output "Subnet IPs" {
  value = "${join(", ", module.network.subnet_ips)}"
}

output "Public Security Group" {
  value = "${module.network.public_sg}"
}

#############---Compute/output.tf ------#########

output "Public Instance IDs" {
  value = "${module.compute.server_id}"
}

output "Public Instance IPs" {
  value = "${module.compute.server_ip}"
}
