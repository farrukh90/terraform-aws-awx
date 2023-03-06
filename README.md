# Steps to install awx tower. 
##### [Module location](https://registry.terraform.io/modules/farrukh90/awx/aws/latest)


```
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
  private_key = var.private_key
}
output "credentials" {
  value = module.awx.credentials
}


```
