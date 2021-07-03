variable "awx_config" {
    type = map 
    default = {
        region = "us-east-1"
        instance_type = "m5.xlarge"
        key_name = "ansible"
    }
}