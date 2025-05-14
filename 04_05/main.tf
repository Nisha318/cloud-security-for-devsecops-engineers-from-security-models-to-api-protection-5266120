resource "aws_s3_bucket" "insecure_bucket" {
    bucket = "insecure-public-bucket-example"
    acl    = "public-read"

    tags = {
        Name        = "InsecureBucket"
        Environment = "Test"
    }
}

resource "aws_security_group" "insecure_sg" {
    name        = "insecure-sg"
    description = "Allow all inbound traffic"
    vpc_id      = "vpc-12345678" # Replace with your VPC ID

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name        = "InsecureSG"
        Environment = "Test"
    }
}

resource "aws_instance" "insecure_instance" {
    ami           = "ami-12345678" # Replace with a valid AMI ID
    instance_type = "t2.micro"

    security_groups = [aws_security_group.insecure_sg.name]

    tags = {
        Name        = "InsecureInstance"
        Environment = "Test"
    }
}