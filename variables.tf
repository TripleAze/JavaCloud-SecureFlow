variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (Amazon Linux 2023)"
  type        = string
  default     = "ami-0c101f26f147fa7fd" # Update this to the latest Amazon Linux 2023 AMI in your region
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
