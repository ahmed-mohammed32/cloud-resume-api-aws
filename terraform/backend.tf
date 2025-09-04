terraform {
  backend "s3" {
    bucket = "cloud-resume-api-aws-bucket"
    key    = "env/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
