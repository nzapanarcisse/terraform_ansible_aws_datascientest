resource "aws_instance" "ic-webapp-ec2" {
  ami               = "ami-0e86e20dae9224db8"
  instance_type     = var.instance_type
  key_name          = var.ssh_key
  availability_zone = var.AZ
  security_groups   = ["${var.sg_name}"]
  tags = {
    Name = "${var.maintainer}-ec2"
  }

  root_block_device {
    delete_on_termination = true
  }

  provisioner "local-exec" {
    command = "echo ${var.public_ip} > $(pwd)/public_ip.txt"
  }

}

