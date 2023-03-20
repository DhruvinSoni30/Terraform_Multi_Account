terraform {
  backend "s3" {
    bucket  = "dhsoni-terraform-account-2"
    key     = "prod/terraform.tfstate"
    region  = "us-east-2"
    profile = "account_2"
    shared_credentials_file = "~/.aws/credentials"
  }
}