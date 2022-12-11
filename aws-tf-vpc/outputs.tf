output "vpc_arn" {
  description = "ARN of the bucket"
  value       = module.main_vpc.arn
}

output "vpc_id" {
  description = "ID of the bucket"
  value       = module.main_vpc.id
}