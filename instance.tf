provider "aws" {
  region = var.awx_config["region"]
}
resource "aws_key_pair" "ansible" {
  key_name_prefix   = var.awx_config["key_name"]
  public_key = file("~/.ssh/id_rsa.pub")
  tags       = var.tags
}


data "aws_ami" "centos" {
  most_recent = true
  owners      = ["679593333241"]
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
}

resource "aws_security_group" "used-for-ansible-tower" {
  name        = "used-for-ansible-tower"
  description = "Used for ansible"
  vpc_id      = module.vpc.vpc
  ingress {
    description = "TLS from VPC"
    from_port   = 1
    to_port     = 65000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = var.tags
}







module "vpc" {
  source       = "farrukh90/vpc/aws"
  version      = "7.0.0"
  region       = var.awx_config["region"]
  vpc_cidr     = "10.0.0.0/16"
  public_cidr1 = "10.0.1.0/24"
  public_cidr2 = "10.0.2.0/24"
  public_cidr3 = "10.0.3.0/24"
  tags         = var.tags
}

output "vpc" {
  value = module.vpc.vpc
}
output "public_subnet1" {
  value = module.vpc.public_subnets[0]
}


output "public_subnet2" {
  value = module.vpc.public_subnets[1]
}

output "public_subnet3" {
  value = module.vpc.public_subnets[2]
}

output "region" {
  value = module.vpc.region
}


resource "aws_instance" "awx" {
  instance_type               = var.awx_config["instance_type"]
  ami                         = data.aws_ami.centos.id
  key_name                    = aws_key_pair.ansible.key_name
  associate_public_ip_address = "true"
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.used-for-ansible-tower.id]
  iam_instance_profile        = "ansible-tower"

  provisioner "file" {
    source      = "${path.module}/awx"
    destination = "/tmp/"


    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
  }
  provisioner "remote-exec" {
    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "centos"
      private_key = file("~/.ssh/id_rsa")
    }
    inline = [
      "sudo yum install -y epel-release",
      "sudo yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python-devel python-pip python-docker-py vim-enhanced ",
      "sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo",
      "sudo yum install  docker-ce -y",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo pip uninstall docker docker-py docker-compose",
      "sudo pip install docker-compose==1.9",
      "sudo ansible-playbook -i /tmp/awx/installer/inventory /tmp/awx/installer/install.yml -vv",
    ]
  }
  tags = var.tags
}
