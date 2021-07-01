output "credentials" {
    value = <<EOF

            username: admin
            password: password
            console: http://${aws_instance.awx.public_ip}
            region: ${var.awx_config["region"]}

EOF
}
