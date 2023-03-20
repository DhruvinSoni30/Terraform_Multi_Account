# configure aws provider
provider "aws" {
  region  = var.region
  profile = "account_2"
  alias = "prod"
}