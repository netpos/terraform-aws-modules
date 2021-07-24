output "target_group_arn" {
  value = concat(aws_lb_target_group.ip_target_group.*.arn, [
    null])[0]
}

output "target_group_arn_suffix" {
  value = concat(aws_lb_target_group.ip_target_group.*.arn_suffix, [
    null])[0]
}