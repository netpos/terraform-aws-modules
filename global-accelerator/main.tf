resource "aws_globalaccelerator_accelerator" "global_accelerator" {
  name = var.name
  ip_address_type = var.ip_address_type
  enabled = var.is_global_accelerator_enabled
}

resource "aws_globalaccelerator_listener" "global_accelerator_listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.global_accelerator.id
  client_affinity = "SOURCE_IP"
  protocol = "TCP"

  port_range {
    from_port = 80
    to_port = 80
  }

  port_range {
    from_port = 443
    to_port = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "global_accelerator_endpoint_group" {
  listener_arn = aws_globalaccelerator_listener.global_accelerator_listener.id

  endpoint_configuration {
    client_ip_preservation_enabled = true
    endpoint_id = var.endpoint_arn
    weight = 100
  }
}