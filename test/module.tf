module "awx" {
  source = "../"
  awx_config = {
    region        = "us-east-1"
    instance_type = "m5.xlarge"
    key_name      = "ansible-tower"
  }
  tags = {
    Name       = "Ansible-Tower"
    Created_by = "Terraform"
  }
  public_key = var.public_key
}
output "username" {
  value = module.awx.username
}
output "password" {
  value = module.awx.password
}
output "url" {
  value = module.awx.url
}
output "public_ip" {
  value = module.awx.public_ip
}