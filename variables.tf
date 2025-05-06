variable "environment" {
  description = "Environment for the route53 resources (e.g., dev, staging, prod)"
  type        = string
}

variable "cost_center" {
  description = "Cost center for tagging the route53 resources"
  type        = string
}

variable "additional_tags" {
  description = "Additional tags for the route53 resources"
  type        = map(string)
  default     = {}
}

variable "zone_name" {
  description = "The name of the Route53 hosted zone (e.g., example.com)"
  type        = string
}

variable "comment" {
  description = "A comment for the hosted zone (optional)"
  type        = string
  default     = null
}

variable "records" {
  description = "List of DNS records to create in the hosted zone. Provide one or more."
  type = list(object({
    name   = string
    type   = string
    ttl    = number
    values = list(string)
  }))
}
