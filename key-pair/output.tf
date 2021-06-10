output "id_key_pair_jumpox" {
  value = aws_key_pair.jumpbox_key_pair.id
}

output "name_key_pair_jumpox" {
  value = aws_key_pair.jumpbox_key_pair.key_name
}