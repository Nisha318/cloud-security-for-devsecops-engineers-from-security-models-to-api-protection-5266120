resource "aws_iam_role" "excessive_role" {
  name = "ExcessivePermissionsRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "excessive_policy" {
  name        = "ExcessivePolicy"
  description = "Dangerously permissive policy for demo"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_excessive" {
  role       = aws_iam_role.excessive_role.name
  policy_arn = aws_iam_policy.excessive_policy.arn
}