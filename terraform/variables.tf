variable "aws_region" {
  description = "AWS region for the demo infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  type    = string
  default = "cloud-k8s-demo"
}
