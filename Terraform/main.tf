provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "flask_sg" {
  name = "flask-app"

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
    cidr_blocks = ["0.0.0.0/0"] # tighten later
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "flask_ec2" {
  ami           = "ami-0ff5003538b60d5ec" # Amazon Linux 2023 (Mumbai)
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.flask_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y python3 python3-pip

              mkdir -p /opt/flask-app
              cd /opt/flask-app

              cat <<'EOT' > app.py
              from flask import Flask

              app = Flask(__name__)

              @app.route("/")
              def home():
                  return """
                  <html>
                    <head>
                      <title>Flask App</title>
                    </head>
                    <body style="font-family: Arial; background-color: white;">
                      <h1>🚀 Deployment Successful</h1>
                      <p>Deployed via GitHub Actions + Terraform</p>
                    </body>
                  </html>
                  """

              if __name__ == "__main__":
                  app.run(host="0.0.0.0", port=8000)
              EOT

              pip3 install flask
              nohup python3 app.py > /var/log/flask.log 2>&1 &
              EOF

  tags = {
    Name = "flask-app-manuall"
  }
}

output "ec2_public_ip" {
  value = aws_instance.flask_ec2.public_ip
}


