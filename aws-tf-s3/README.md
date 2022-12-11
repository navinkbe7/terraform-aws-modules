AWS-TF-S3
---
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.46.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_website_s3_bucket"></a> [website\_s3\_bucket](#module\_website\_s3\_bucket) | ./modules/aws-s3-static-website-bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_kms_key.key_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.object_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.object_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_object.cipher_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.cipher_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.cipher_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_website_bucket_arn"></a> [website\_bucket\_arn](#output\_website\_bucket\_arn) | ARN of the bucket |
| <a name="output_website_bucket_domain"></a> [website\_bucket\_domain](#output\_website\_bucket\_domain) | Domain name of the bucket |
| <a name="output_website_bucket_endpoint"></a> [website\_bucket\_endpoint](#output\_website\_bucket\_endpoint) | Endpoint of the bucket |
| <a name="output_website_bucket_name"></a> [website\_bucket\_name](#output\_website\_bucket\_name) | Name (id) of the bucket |
<!-- END_TF_DOCS -->