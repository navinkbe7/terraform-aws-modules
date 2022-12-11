module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "animals-for-life-nilango"
  versioning  = "Enabled"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


