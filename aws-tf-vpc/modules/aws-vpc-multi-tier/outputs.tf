# Output variable definitions

output "arn" {
  description = "ARN of the bucket"
  value       = aws_vpc.main.arn
}

output "id" {
  description = "ID of the bucket"
  value       = aws_vpc.main.id
}