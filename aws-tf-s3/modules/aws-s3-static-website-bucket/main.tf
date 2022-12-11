resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status     = var.versioning
    mfa_delete = var.mfa_delete
  }
}

resource "aws_s3_bucket_accelerate_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.bucket
  status = var.accelerated_transfer
}

resource "aws_s3_bucket_website_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}


#TODO: By default the bucket endpoint is HTTP and need to enable HTTPS
# https://adamtheautomator.com/aws-s3-static-ssl-website/

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.public_read.json
}

data "aws_iam_policy_document" "public_read" {
  statement {
    sid = "PublicRead"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}

# S3 Replication for Disaster Recovery
resource "aws_s3_bucket" "s3_bucket_dr" {
  provider = aws.dst
  bucket   = "${var.bucket_name}-dst"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "s3_bucket_dr" {
  provider = aws.dst
  bucket   = aws_s3_bucket.s3_bucket_dr.id

  versioning_configuration {
    status     = var.versioning
    mfa_delete = var.mfa_delete
  }
}

resource "aws_s3_bucket_website_configuration" "s3_bucket_dr" {
  provider = aws.dst
  bucket   = aws_s3_bucket.s3_bucket_dr.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_read_dr" {
  provider = aws.dst
  bucket = aws_s3_bucket.s3_bucket_dr.id
  policy = data.aws_iam_policy_document.public_read_dr.json
}

data "aws_iam_policy_document" "public_read_dr" {
  statement {
    sid = "PublicRead"
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket_dr.arn}/*",
    ]
  }
}

#TODO: Implement Cross Account Replication
resource "aws_s3_bucket_replication_configuration" "use1_to_use2" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.s3_bucket]

  role   = aws_iam_role.use1_to_use2.arn
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    id = "all"

    status = "Enabled"
    destination {
      bucket        = aws_s3_bucket.s3_bucket_dr.arn
      storage_class = "STANDARD"
    }
  }
}

resource "aws_iam_role" "use1_to_use2" {
  name = "tf-iam-role-use1_to_use2"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_policy" "use1_to_use2" {
  name = "tf-iam-role-policy-use1_to_use2"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.s3_bucket.arn}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionTagging"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.s3_bucket.arn}/*"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.s3_bucket_dr.arn}/*"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "use1_to_use2" {
  role       = aws_iam_role.use1_to_use2.name
  policy_arn = aws_iam_policy.use1_to_use2.arn
}