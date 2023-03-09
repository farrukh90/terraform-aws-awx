output "username" {
  value = "admin"
}

output "password" {
  value = "password"
}

output public_ip {
  value = aws_instance.awx.public_ip
}

output url {
  value = "http://${aws_instance.awx.public_ip}"
}
