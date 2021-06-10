##Security
resource "aws_security_group" "sg" {
  name = "${var.name}-sg"
  description = var.sg_description
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress
    content {
      description = ingress.value["description"]
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
      protocol = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"] == null ? [] : ingress.value["cidr_blocks"]
      security_groups = ingress.value["security_groups"] == null ? [] : ingress.value["security_groups"]
      self = ingress.value["self"] == null ? false : ingress.value["self"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}