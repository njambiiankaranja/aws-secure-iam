output "developer_group_arn" {
  value       = aws_iam_group.developers.arn
  description = "The ARN of the IAM developers group"
}

output "iam_user_name" {
  value       = aws_iam_user.example_dev.name
  description = "The username of the provisioned IAM developer"
}

output "custom_policy_arn" {
  value       = aws_iam_policy.cloudwatch_read_only.arn
  description = "The ARN of the custom CloudWatch read-only policy"
}