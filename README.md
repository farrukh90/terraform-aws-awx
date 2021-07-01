# Steps to install awx tower. 


```
module "awx" { 
  source = ""farrukh90/vpc/aws" 
  region = "us-east-1"
  instance_type = "t2.large"
  key_name = "ansible"
 }
```


## Credentials
username: admin
password: password
