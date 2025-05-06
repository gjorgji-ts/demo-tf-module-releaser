output "zone_id" {
  description = "The ID of the Route53 hosted zone"
  value       = aws_route53_zone.zone.zone_id
}

output "zone_name" {
  description = "The name of the Route53 hosted zone"
  value       = aws_route53_zone.zone.name
}

output "record_fqdns" {
  description = "Map of FQDNs for all Route53 records"
  value       = { for k, rec in aws_route53_record.record : k => rec.fqdn }
}

output "record_types" {
  description = "Map of types for all Route53 records"
  value       = { for k, rec in aws_route53_record.record : k => rec.type }
}
