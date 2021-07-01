variable "awx_config" {
    type = map 
    default = {
        region = "us-east-1"
        instance_type = "t2.large"
        key_name = "ansible"
    }
}