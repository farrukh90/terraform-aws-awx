# Steps to install awx tower. 
##### [Module location](https://registry.terraform.io/modules/farrukh90/awx/aws/latest)


```
module "awx" { 
  source = "farrukh90/awx/aws" 
  awx_config = {
    region = "us-east-1"
    instance_type = "t2.large"
    key_name = "ansible-tower"
  }
}

output "credentials" {
    value = module.awx.credentials
}

```
