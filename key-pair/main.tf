resource "aws_key_pair" "key_pair" {
  key_name = "${var.name}.${var.environment}.keypair"
  public_key = var.key_pair_public_key

  tags = var.tags
}