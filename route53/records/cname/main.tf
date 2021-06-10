resource "aws_route53_record" "simple_record_cname" {
  zone_id = var.zone_id
  name = var.name
  type = var.type
  ttl = var.ttl
  records = var.records

}