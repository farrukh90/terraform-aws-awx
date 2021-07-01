provider "aws" { 
    region = "us-east-1"   
}    
resource "aws_iam_role" "ansible-tower" {
	name = "ansible-tower"
	assume_role_policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Action": "sts:AssumeRole",
"Principal": {
"Service": "ec2.amazonaws.com"
},
"Effect": "Allow",
"Sid": ""
}
]
}
EOF
}

resource "aws_iam_policy" "ansible-tower" {
  name = "ansible-tower"
  description = "ansible-tower"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "test-attach" {
  role = aws_iam_role.ansible-tower.name
  policy_arn = aws_iam_policy.ansible-tower.arn
}


resource "aws_iam_instance_profile" "ansible-tower" {
  name = "ansible-tower"
  role = aws_iam_role.ansible-tower.name
}
