resource "aws_instance" "ec2" {
  instance_type = var.instance_type

  ami       = var.ami
  key_name  = var.key_pair_name
  subnet_id = var.subnet_id

  vpc_security_group_ids = var.sg_ids

  associate_public_ip_address = var.associate_public_ip_address

  source_dest_check = var.source_dest_check

  tags = var.tags
}