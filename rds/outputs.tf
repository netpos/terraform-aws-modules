output "rds_domain" {
  value = aws_db_instance.rds.address
}

output "rds_sg_access_id" {
  value = module.db_access_sg.sg_id
}

output "rds_sg_id" {
  value = module.rds_sg.sg_id
}

output "rds_arn" {
  value = aws_db_instance.rds.arn
}