output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_service_sg_id" {
  value = module.ecs_service_sg.sg_id
}