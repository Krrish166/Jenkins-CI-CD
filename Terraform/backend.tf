terraform {
  backend "s3" {
    bucket         = "flask-app-bucket-5698" # Change to your unique bucket name
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
