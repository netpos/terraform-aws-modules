resource "aws_route53_record" "simple_record_cname" {
  zone_id = var.zone_id
  name = var.name
  type = var.type

  alias {
    evaluate_target_health = true
    name = var.dns_name
    zone_id = var.alias_zone_id
  }

}