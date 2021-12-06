output "sg_id" {
  value = concat(aws_security_group.sg.*.id, [""])[0]
}