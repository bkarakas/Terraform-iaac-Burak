terraform {
  backend "s3" {
    bucket = "/my-terraform-backend-state"
    key    = "aws/iam/iam_state"
    region = "us-east-1"
  }
}
