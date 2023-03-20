terraform {
  backend "s3" {
    bucket  = "dhsoni-terraform-account-1"
    key     = "dev/terraform.tfstate"
    region  = "us-east-2"
    profile = "account_1"
    shared_credentials_file = "~/.aws/credentials"
  }
}