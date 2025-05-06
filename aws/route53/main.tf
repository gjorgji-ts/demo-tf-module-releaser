resource "aws_route53_zone" "zone" {
  name    = var.zone_name
  comment = var.comment

  tags = merge(
    {
      Name        = var.zone_name
      Environment = var.environment
      CostCenter  = var.cost_center
    },
    var.additional_tags
  )
}

resource "aws_route53_record" "record" {
  for_each = { for idx, rec in var.records : idx => rec }
  zone_id  = aws_route53_zone.zone.zone_id
  name     = each.value.name
  type     = each.value.type
  ttl      = each.value.ttl
  records  = each.value.values
}
