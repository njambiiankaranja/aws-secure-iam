# 1. Create an IAM Group for Cloud Developers/Engineers
resource "aws_iam_group" "developers" {
  name = "${var.environment}-developers-group"
}

# 2. Create a Custom Least-Privilege Policy
# This policy grants read-only access to CloudWatch logs and metrics (no admin power)
resource "aws_iam_policy" "cloudwatch_read_only" {
  name        = "${var.environment}-cloudwatch-read-policy"
  description = "Allows read-only access to CloudWatch logs and monitoring"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "cloudwatch:Describe*",
          "cloudwatch:Get*",
          "cloudwatch:List*",
          "logs:DescribeLogGroups",
          "logs:GetLogEvents",
          "logs:DescribeLogStreams"
        ]
        Resource = "*"
      }
    ]
  })
}

# 3. Attach the Least-Privilege Policy to the Developers Group
resource "aws_iam_group_policy_attachment" "dev_cloudwatch_attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.cloudwatch_read_only.arn
}

# 4. Create an IAM User and Add Them to the Group
resource "aws_iam_user" "example_dev" {
  name = "alex-cloud-dev"
  path = "/"
}

resource "aws_iam_user_group_membership" "dev_membership" {
  user = aws_iam_user.example_dev.name
  groups = [
    aws_iam_group.developers.name
  ]
}