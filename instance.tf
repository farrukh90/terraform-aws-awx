provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "ansible" {
  key_name   = "ansible"
  public_key = file("~/.ssh/id_rsa.pub")
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


resource "aws_instance" "awx" {
  instance_type               = "t2.large"
  ami                         = data.aws_ami.centos.id
  key_name                    = aws_key_pair.ansible.key_name
  associate_public_ip_address = "true"

  provisioner "file" {
    source      = "awx"
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
}