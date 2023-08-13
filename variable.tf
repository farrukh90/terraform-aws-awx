variable "awx_config" {
  type = map(any)
  default = {
    region        = ""
    instance_type = ""
    key_name      = ""
    vpc_id        = ""
    subnet_id     = ""
  }
}
variable "tags" {
  type = map(any)
  default = {
    Name       = "Ansible-Tower"
    Created_by = "Terraform"
  }
}
