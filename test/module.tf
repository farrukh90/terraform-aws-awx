module "awx" {
  source  = "farrukh90/awx/aws"
  version = "13.0.10"
  awx_config = {
    instance_type         = "m5.xlarge"
    key_name              = "used-for-ansible-tower"
    vpc_id                = "vpc-742db61c"
    subnet_id             = "subnet-f003a68a"
    vpc_security_group_id = "sg-02e83345d11309839"
    private_key           = base64decode("LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBZ3ArMmkvWHlOWHV2ZU5yWjRHTUd1VjhEUy9sbUFzWDdiMy92WDg3Z2ZvYlRNd3Y5CnFENDErd1hISytJelAvMEdya2c1SmVpbncwaWhwYzVTTjB6RUp1YzBCanBZbzM2aUhJMXkrWmk5eWZVS2x2MkYKeStYRXZYK2VpeGhXOGlEUllwR3p1WUdzRkRSRDJYMFhRcXFLc2hlLzlIdGVUTmFKYk5pcTFETllsM04veW9lQwprUThISUNsVUVMdW1UVFV6YXRLK1ZYYlRDWm0wa3lKVklCaGk5azlaQTJOTjFRcTQvZk1XYkMwTW9KOHVlNWVGCkpFR2dQTmRDOWNIQ29JU0dsNlJxODZ6UnBzb2hmSFB5Yit6STE4TzQzTGJ4UWpXOVliVjkxWDBqVHVJQ3lrY3EKbGsyM3VPTGlyWmQweVlvNVg5ZnBia1ByZHRFSXA4RnQzd3hVZVFJREFRQUJBb0lCQUJuQjJxSXdwa2tya1lkWQpTRnc1eXFxazlLWjNrRWo5dHozZVVWcG9GZFo5U1lvb1ZDVm4xd2NmdFkyT3RpSnBCM2M0WUtSOEF4Qzc4cndhCk9oWVRlaDVkdXVGN2dkMERiSDRLMm1BallWRkFrNDBBZ3ZDWTV6bWl2NldYOEJVZ3FZa3hSK3BOaXB3VlRrZkYKcGQrTWQzcjB1ZkpBblhDellUZm9aWThnYk5pNEx2QTJiQ2VPSlZDV2Z4MXN4bDVmWDFNdHVGNVlnaTJPb3VSQwpONmRZQ1l5UDVFMG1BbmVQVmhQUVc1cDVyQ0pUREEvVUQ3c2FtV2tyT2dyZGg0ajNhRXpzekVZb2hzNjVLU3ZGClRVQVlhaTBndkIwbE9KZkJvSTV2Unh2d1BWTnJiYlMwUE5ndmxLUG0reHpBUGdBT0FhSUxlU3JtdVU4VSt4MGIKbnpxMmFJRUNnWUVBKzFLYkpjRGNweWFDUS9vTWdKVGN2SDkvKzNIVVpwZTR6Q2F2bmJBajloWkUwZk9DNm9FbApNdTJQOXJGVGZpWHNNeFRvdyt2TU5MSUdqREN5VVhBNU5UR3duRWRpdVlvWGRNaFZRdTllK09sam80T0xzU3EwCkg0QjFNbzd2SkhGd2k3UXdTL0dVTWsyaE5ONVFnM1lMdXdSeFc0NFQwdWttZ2pNTG1UUWs4TEVDZ1lFQWhRNE4Kck5NcGl0azZXbm14NTZ4aXUxN1ZHUTlSTVpiT3NhYnNqQzZIbDk2NWxvMW5jQjBNTGZLZjN6R0JEZ2ljb1ExQwpiTENFcy9ONkQvaURzbTZKaU9YMTJBRVVJaWFRVTZrZHUvbHdZN2hiTDRUcis4bmpSYVdDTUtDYU5uOUsrUG01CkdZeUhXTWM5ZjdLNWNvVE0yTTZOVERNSXNMd2lRRFdLNVlUYlVra0NnWUVBaWNZTUpWTW40ejM2RlhmRFdNM0MKZ0ZkSStyZTVINUMzRHJ0NmRIQjJGbGE0M1h1bjNoUjBKd29TYk1OaktQbHpGY0cxcElua1JWTCt3ZVdFSzU3Zwp6YWR5MFFsVk5xOWNFbm9zTzJocjRQcFkwKyt1S2E1bVZncWV0TnVrZjQ3c2lybDU3SGYvck4vZnF0TGd3bUI1Cko4blV0c01aWFByUlVIalpOK0JkQzlFQ2dZQUxQVVNxZEt2dHJxdmZPS2h1aVlGTmtwVXRxTDJURXNvaTk1YkQKd0twemliemptczVDQ2pJZEw0R1J1UHpOMHF4b2JsWk9HQnNkbUZPWFJjYmFLN3d5ZERwd0pLY3V1MU0xdmZObApEWTBRMzJIVWdjWHRYd0J6d2FkZHRETlNweTRPR2dvb3ZsWXdpYVFJUlhDazI5THgvWUN5RHgyTTBGZVVWUEdHCnNkSlZBUUtCZ1FDRTM4bXJXNVBFQytjUTF5NkVMcmdKeE45dHRlYlg5QjZvSVFYZU1WVW5ZY0xyZEhqUksyVHgKNVZ2VHgxTDZOdWNEU0tGaTQrVTRQcGlZOXRrSyt1dVZxejdJOENYUzMxbXBMRnNKb2N4VEFEb1ZHLzZaV0oxWQoxMWovSTMrVHhMd0ZXTTJoWVNSeDBJUjFuRWg0RXFiRDM3ZGNXWEMxbXI5QU4wNC9ITjVURlE9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=")
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
