resource "aws_eip" "eip" {
  instance = var.instance_id
  vpc      = true

  tags = var.tags
}