# This Terraform configuration creates resources that are intentionally insecure
# for demonstration purposes. These resources should not be used in production.
provider "aws" {
    region = "us-west-2"
}

# This S3 bucket is configured to allow public read access, which can lead to data exposure.
resource "aws_s3_bucket" "insecure_bucket" {
    bucket = "insecure-public-bucket-example"
    acl    = "public-read"

    tags = {
        Name        = "InsecureBucket"
        Environment = "Test"
    }
}

# This KMS Key has overly permissive policies that allow any AWS account to use it.
# This is a security risk as it allows unauthorized access to encrypted data.
resource "aws_kms_key" "vulnerable_key" {
    description             = "Vulnerable KMS key with wide permissions"
    deletion_window_in_days = 7
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Id": "key-default-1",
    "Statement": [
        {
            "Sid": "EnableAllPermissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "kms:*",
            "Resource": "*"
        }
    ]
}
EOF

    tags = {
        Name        = "VulnerableKMSKey"
        Environment = "Test"
    }
}

# This IAM role is attached to a Lambda function and has AdministratorAccess,
# which grants it full access to all AWS services and resources.
# This is a significant security risk as it allows the Lambda function to perform any action in the AWS account.
resource "aws_iam_role" "lambda_vulnerable_role" {
    name = "lambda-vulnerable-role"

    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF

    tags = {
        Name        = "LambdaVulnerableRole"
        Environment = "Test"
    }
}
resource "aws_iam_role_policy" "lambda_vulnerable_inline_policy" {
    name = "lambda-vulnerable-inline-policy"
    role = aws_iam_role.lambda_vulnerable_role.id

    policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": "*",
                "Resource": "*"
            }
        ]
    }
    EOF
}