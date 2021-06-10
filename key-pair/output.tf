output "id_key_pair" {
  value = aws_key_pair.key_pair.id
}

output "name_key_pair" {
  value = aws_key_pair.key_pair.key_name
}