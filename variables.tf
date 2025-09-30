variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-central-1" #Frankfurt
}


variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "default"
}

variable "project_prefix" {
  description = "Prefix for resources names"
  type        = string
  default     = "connect_nelly_demo"
}

