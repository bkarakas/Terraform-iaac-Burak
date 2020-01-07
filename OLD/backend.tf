terraform {
  backend "s3" {
    bucket = "/my-terraform-backend-state"
    key    = "infrastructure"
    region = "us-east-1"
  }
}
