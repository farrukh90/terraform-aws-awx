output "credentials" {
  value = <<EOF

            username: admin
            password: password
            console: http://${aws_instance.awx.public_ip}

EOF
}
output public_ip {
  value = aws_instance.awx.public_ip
}

output private_ip {
  value = aws_instance.awx.private_ip
}

output username { 
  value = "admin"
}

output password { 
  value = "password"
}
