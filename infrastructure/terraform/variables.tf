variable "aws_region" {
  description = "AWS region for the IoT platform"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "ibms-iot-platform"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}