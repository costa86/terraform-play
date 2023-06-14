output "aws_instance_server_ip" {
  value = aws_instance.server.public_ip
}


# output "aws_instance_others_ip" {
#   value = aws_instance.others.*.ami
# }
