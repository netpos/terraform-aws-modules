output "lb_arn" {
  value = aws_lb.lb.arn
}

output "lb_arn_suffix" {
  value = aws_lb.lb.arn_suffix
}

output "lb_name" {
  value = aws_lb.lb.name
}

output "dns_name" {
  value = aws_lb.lb.dns_name
}

output "zone_id" {
  value = aws_lb.lb.zone_id
}