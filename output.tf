output "credentials" {
  value = <<EOF

            username: admin
            password: password
            console: http://${aws_instance.awx.public_ip}

EOF
}
output public_ip {
  value = aws_instance.aws.public_ip
}
