# Steps to install awx tower. 


```
module "awx" { 
  source = "farrukh90/awx/aws" 
  awx_config = {
    region = "us-east-1"
    instance_type = "t2.large"
    key_name = "ansible"
  }
}

output "credentials" {
    value = module.awx.credentials
}
```


## Credentials
username: admin
password: password
