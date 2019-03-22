output "server_id" {
  value = "${join(", ", aws_instance.tf_mypro_server.*.id)}"
}

output "server_ip" {
  value = "${join(", ", aws_instance.tf_mypro_server.*.public_ip)}"
}