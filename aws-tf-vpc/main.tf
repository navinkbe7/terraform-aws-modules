module "main_vpc" {
  source = "./modules/aws-vpc-multi-tier"

  vpc_name = "multi-tier-v1"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

