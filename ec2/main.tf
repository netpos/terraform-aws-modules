resource "aws_instance" "ec2" {
  key_name = var.key_pair_name
  ami = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = var.subnet_id
  tags = {
    Name = var.name
    environment = var.environment
  }
  vpc_security_group_ids = var.sg_ids

}