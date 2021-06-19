resource "aws_ses_template" "templates" {
  count = length(var.templates)
  name = "${var.prefix_name}-${var.templates[count.index].name}"
  subject = var.templates[count.index].subject
  html = var.from_file ? file(var.templates[count.index].html) : var.templates[count.index].html
  text = var.from_file ? file(var.templates[count.index].text) : var.templates[count.index].text
}