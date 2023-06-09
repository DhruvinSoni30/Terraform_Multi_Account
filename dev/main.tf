provider "aws" {
  region  = var.region
  profile = "account_1"
  alias = "dev"
}

# create VPC
module "vpc" {

  providers = {
    aws = aws.dev
  }

  source                 = "../modules/vpc"
  region                 = var.region
  project_name           = var.project_name
  vpc_cidr               = var.vpc_cidr
  public_subnet_az1_cidr = var.public_subnet_az1_cidr

}

# create Security Group
module "security_group" {

  providers = {
    aws = aws.dev
  }

  source = "../modules/security-groups"
  vpc_id = module.vpc.vpc_id

}

# create key pair
module "key_pair" {

  providers = {
    aws = aws.dev
  }

  source = "../modules/key_pair"

}

# create EC2 instance
module "ec2_instance" {

  providers = {
    aws = aws.dev
  }

  source                    = "../modules/ec2"
  ami_id                    = var.ami_id
  instance_type             = var.instance_type
  public_ec2_security_group = module.security_group.public_ec2_security_group_id
  public_subnet_az1         = module.vpc.public_subnet_az1_id
  project_name              = module.vpc.project_name
  key_id                    = module.key_pair.key_id

}





