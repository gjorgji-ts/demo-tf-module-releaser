variable "environment" {
  description = "Environment for the S3 bucket (e.g., dev, staging, prod)"
  type        = string
}

variable "cost_center" {
  description = "Cost center for tagging the S3 bucket"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags for the S3 bucket"
  type        = map(string)
  default     = {}
}

variable "prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "force_destroy" {
  description = "Force destroy the S3 bucket even if it contains objects"
  type        = bool
  default     = false
}

variable "bucket_acl" {
  description = "The canned ACL to apply to the bucket"
  type        = string
  default     = "private"
}

variable "versioning" {
  description = "Enable versioning for the S3 bucket"
  type        = bool
  default     = false
}
