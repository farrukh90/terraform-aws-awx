module "awx" {
  source = "farrukh90/awx/aws"
  version = "13.0.8"
  awx_config = {
    instance_type         = "m5.xlarge"
    key_name              = "ansible-tower"
    vpc_id                = "vpc-742db61c"
    subnet_id             = "subnet-f003a68a"
    vpc_security_group_id = "sg-02e83345d11309839"
  }
  tags = {
    Name       = "Ansible-Tower"
    Created_by = "Terraform"
  }
}

output "credentials" {
  value = module.awx.credentials
}

provider "aws" {
  region = "ca-central-1"
}
