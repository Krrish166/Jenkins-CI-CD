provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "python_sg" {
  name = "python-app-sg"

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "python_ec2" {
  ami           = "ami-0ff5003538b60d5ec" # Amazon Linux 2 AMI
  instance_type = "t3.micro"


  vpc_security_group_ids = [aws_security_group.python_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y python3 pip git
              pip3 install flask

              cat <<EOT > /home/ec2-user/app.py
              from flask import Flask, jsonify
              app = Flask(__name__)

              @app.route("/")
              def home():
                  return jsonify({"message": "Hello from Terraform CI/CD 🚀"})

              app.run(host="0.0.0.0", port=8000)
              EOT

              nohup python3 /home/ec2-user/app.py &
              EOF

  tags = {
    Name = "python-terraform-app"
  }
}
