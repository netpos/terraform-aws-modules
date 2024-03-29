resource "aws_sqs_queue" "sqs_queue" {
  name = var.name
  delay_seconds = var.delay_seconds
  max_message_size = var.max_message_size
  message_retention_seconds = var.message_retention_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
  fifo_queue = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication
  deduplication_scope = var.deduplication_scope
  fifo_throughput_limit = var.fifo_throughput_limit
  kms_master_key_id = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds
  redrive_policy = var.redrive_policy
  tags = var.tags
}

resource "aws_sqs_queue_policy" "sqs_queue_policy_allow_access" {
  queue_url = aws_sqs_queue.sqs_queue.id
  count = var.create_policy_allow_access ? 1 : 0
  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Id": "sqspolicy",
    "Statement": [
      {
        "Sid": "First",
        "Effect": "Allow",
        "Principal": "*",
        "Action": "sqs:SendMessage",
        "Resource": "${aws_sqs_queue.sqs_queue.arn}",
        "Condition": {
          "ArnEquals": {
            "aws:SourceArn": "${var.source_access_arn}"
          }
        }
      }
    ]
  }
  POLICY
}
