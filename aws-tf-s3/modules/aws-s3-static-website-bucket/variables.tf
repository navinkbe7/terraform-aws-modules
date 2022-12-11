# Input variable definitions

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "Versioning state of the bucket"
  type        = string
  default     = "Disabled"
}

variable "mfa_delete" {
  description = "Versioning state of the bucket"
  type        = string
  default     = "Disabled"
}

variable "accelerated_transfer" {
  description = "Versioning state of the bucket"
  type        = string
  default     = "Suspended"
}

