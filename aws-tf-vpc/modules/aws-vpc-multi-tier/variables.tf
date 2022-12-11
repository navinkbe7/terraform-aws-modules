# Input variable definitions

variable "vpc_name" {
  description = "Name of the vpc"
  type        = string
}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}
