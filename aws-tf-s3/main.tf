module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = "animals-for-life-nilango"
  versioning  = "Suspended"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# S3 Encryption
resource "aws_s3_bucket" "object_encryption" {
  count  = 0
  bucket = "object-encryption-nilango"
}

resource "aws_s3_bucket_public_access_block" "object_encryption" {
  count                   = 0
  bucket                  = aws_s3_bucket.object_encryption[count.index].id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# SSE - AWS Managed Key (AES256)


resource "aws_s3_object" "cipher_1" {
  count                  = 0
  key                    = "cipher-1"
  bucket                 = aws_s3_bucket.object_encryption[count.index].id
  content                = "Hello World 1"
  server_side_encryption = "AES256"
}

# SSE - S3 Default Master(KMS) Key (aws:kms)
resource "aws_s3_object" "cipher_2" {
  count                  = 0
  key                    = "cipher-2"
  bucket                 = aws_s3_bucket.object_encryption[count.index].id
  content                = "Hello World 2"
  server_side_encryption = "aws:kms"
}

# SSE - Customer Managed Key (Using KMS)

# TODO: Implement Role Seperation
# https://aws.amazon.com/blogs/security/how-to-use-kms-and-iam-to-enable-independent-security-controls-for-encrypted-data-in-s3/

resource "aws_kms_key" "key_1" {
  count                   = 0
  description             = "KMS key 1"
  deletion_window_in_days = 7
}

resource "aws_s3_object" "cipher_3" {
  count      = 0
  key        = "cipher-3"
  bucket     = aws_s3_bucket.object_encryption[count.index].id
  content    = "Hello World 3"
  kms_key_id = aws_kms_key.key_1[count.index].arn
}
