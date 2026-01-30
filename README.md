Flask Application Deployment on AWS using Terraform & GitHub Actions
📌 Overview

This project demonstrates how to deploy a Python Flask web application on an AWS EC2 instance using Terraform (Infrastructure as Code) and automate the workflow using GitHub Actions CI/CD.

Terraform provisions the AWS infrastructure, while a bootstrap script (user_data) installs dependencies and runs the Flask application automatically at instance launch.

🛠️ Tech Stack

Cloud Provider: AWS

Infrastructure as Code: Terraform

Application: Python Flask

CI/CD: GitHub Actions

OS: Amazon Linux (EC2)

📁 Project Structure
.
├── main.tf
├── variables.tf
├── outputs.tf
├── .github/
│   └── workflows/
│       └── terraform.yml
└── README.md

🚀 What This Project Does

Creates an EC2 instance using Terraform

Configures a Security Group to allow:

SSH access (port 22)

Flask application access (port 8000)

Uses a user_data script to:

Install Python and pip

Install Flask

Create a Flask application (app.py)

Run the Flask app automatically on startup

Displays a normal HTML web page in the browser after deployment

🌐 Application Output

After deployment, access the application using:

http://<EC2_PUBLIC_IP>:8000

Browser Output:
🚀 Deployment Successful
Deployed via GitHub Actions + Terraform

⚙️ Terraform Workflow

Initialize Terraform:

terraform init


Preview infrastructure changes:

terraform plan


Apply infrastructure:

terraform apply


Terraform provisions the infrastructure and deploys the Flask app automatically using user_data.

🔁 GitHub Actions CI/CD Pipeline

This project uses GitHub Actions to automate Terraform execution.

CI/CD Flow:

On push or pull request

Runs terraform init

Runs terraform validate

Runs terraform plan

Manual approval

terraform apply is triggered manually using the GitHub Actions UI

Prevents accidental infrastructure changes

Benefits:

Automated infrastructure validation

Safe and controlled deployments

No manual Terraform execution from local machines

Industry-standard DevOps practice

🔐 Security Notes

SSH access should be restricted to a trusted IP range

In production:

Use IAM roles instead of access keys

Run Flask with gunicorn and systemd

Place NGINX in front of the application

Enable HTTPS using ACM

🎯 Key DevOps Concepts Demonstrated

Infrastructure as Code (IaC)

Automated EC2 bootstrapping with user_data

CI/CD for infrastructure using GitHub Actions

Cloud-based application deployment

Reproducible and scalable infrastructure

🧠 Interview Summary (One Line)

This project showcases deploying a Flask application on AWS using Terraform with automated CI/CD through GitHub Actions, following real-world DevOps best practices.
