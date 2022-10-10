output "rds_domain" {
  value = concat(aws_db_instance.rds.*.address, [
    null])[0]
}
