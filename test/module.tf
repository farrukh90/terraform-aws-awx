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
}
output "credentials" {
  value = module.awx.credentials
}
