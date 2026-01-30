🚀 Flask Application Deployment on AWS using Terraform & GitHub Actions
📌 Overview

       This project demonstrates how to deploy a Python Flask web application on an AWS EC2 instance using Terraform (Infrastructure as Code) and automate the deployment workflow using
       GitHub Actions CI/CD.

       Terraform provisions the AWS infrastructure, while a bootstrap script (user_data) installs all required dependencies and runs the Flask application automatically when the EC2 
       instance launches.

🛠️ Tech Stack

    Cloud Provider: AWS

    Infrastructure as Code: Terraform

    Application: Python Flask

    CI/CD: GitHub Actions

Operating System: Amazon Linux (EC2)

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

   Provisions an AWS EC2 instance using Terraform

   Configures a Security Group to allow:

   SSH access (port 22)

   Flask application access (port 8000)

   Uses a user_data script to:

   Install Python and pip
  
   Install Flask

   Create a Flask application (app.py)

   Automatically start the Flask app on instance boot

   Deploys a simple HTML web page accessible via a browser

🌐 Application Output

   Once deployment is complete, access the application using:

             http://<EC2_PUBLIC_IP>:8000

   Browser Output:

             🚀 Deployment Successful
        Deployed via GitHub Actions + Terraform

⚙️ Terraform Workflow

    Terraform handles both infrastructure provisioning and application deployment.

    Steps:
    terraform init
    terraform plan
    terraform apply


     terraform init → Initializes providers and backend

     terraform plan → Previews infrastructure changes

     terraform apply → Provisions AWS resources and deploys the Flask app automatically using user_data

🔁 GitHub Actions CI/CD Pipeline

     This project uses GitHub Actions to automate Terraform execution and ensure safe deployments.

CI/CD Flow:

     Triggered on push / pull request

     Runs:

       terraform init

       terraform validate

       terraform plan

        Requires manual approval

       terraform apply is triggered manually via GitHub Actions UI

Benefits:

    Automated infrastructure validation

    Controlled and safe deployments

     Prevents accidental infrastructure changes

     No need to run Terraform from local machines

    Follows industry-standard DevOps practices

    🔐 Security Notes

    ⚠️ For production environments, additional hardening is recommended.

    Restrict SSH access to trusted IP ranges only

    Use IAM roles instead of AWS access keys

    Run Flask using Gunicorn + systemd

    Place NGINX in front of the Flask app

    Enable HTTPS using AWS ACM

🎯 Key DevOps Concepts Demonstrated

    Infrastructure as Code (IaC)

    Automated EC2 bootstrapping with user_data

    CI/CD for infrastructure using GitHub Actions

    Cloud-based application deployment
 
    Reproducible and scalable infrastructure