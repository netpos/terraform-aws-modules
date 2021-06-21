output "rds_domain" {
  value = concat(aws_db_instance.rds.*.domain, [
    null])[0]
}
