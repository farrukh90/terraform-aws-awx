variable "awx_config" {
  type = map(any)
  default = {
    region        = "us-east-1"
    instance_type = "m5.xlarge"
    key_name      = "ansible"
  }
}
variable "tags" {
  type = map(any)
  default = {
    Name       = "Ansible-Tower"
    Created_by = "Terraform"
  }
}