resource "aws_key_pair" "ansible" {
  key_name_prefix = var.awx_config["key_name"]
  public_key      = file("~/.ssh/id_rsa.pub")
  tags            = var.tags
}



resource "aws_instance" "awx" {
  instance_type               = var.awx_config["instance_type"]
  ami                         = "ami-0ca3e32c623d61bdf"
  key_name                    = aws_key_pair.ansible.key_name
  associate_public_ip_address = "true"
  subnet_id                   = var.awx_config["subnet_id"]
  vpc_security_group_ids      = [var.awx_config["vpc_security_group_id"]]

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
