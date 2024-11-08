provider "aws" {
  region = "us-east-1" # Change to your preferred region
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.web_sg.name]

  # Connection block for SSH access
  connection {
    type        = "ssh"
    user        = "ec2-user" # Default for Amazon Linux 2
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  # Provisioner to install Apache (httpd)
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd"
    ]
  }

  # Provisioner to upload files using the local_file_path variable
  provisioner "file" {
    source      = "${var.local_file_path}/index.html"
    destination = "/tmp/index.html"
  }

  provisioner "file" {
    source      = "${var.local_file_path}/profile.html"
    destination = "/tmp/profile.html"
  }

  provisioner "file" {
    source      = "${var.local_file_path}/socials.html"
    destination = "/tmp/socials.html"
  }

  provisioner "file" {
    source      = "${var.local_file_path}/terms.html"
    destination = "/tmp/terms.html"
  }

  provisioner "file" {
    source      = "${var.local_file_path}/contact.html"
    destination = "/tmp/contact.html"
  }

  # Provisioner to move files to the Apache directory
  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo mv /tmp/profile.html /var/www/html/profile.html",
      "sudo mv /tmp/socials.html /var/www/html/socials.html",
      "sudo mv /tmp/terms.html /var/www/html/terms.html",
      "sudo mv /tmp/contact.html /var/www/html/contact.html"
    ]
  }

  tags = {
    Name = "WebServer"
  }
}
