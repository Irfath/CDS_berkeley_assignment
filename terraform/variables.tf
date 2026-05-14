variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "berkeley-cluster"
}

variable "environment" {
  description = "Environment name for tagging"
  type        = string
  default     = "dev"
}