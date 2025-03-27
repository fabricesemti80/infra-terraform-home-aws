# resource "aws_dynamodb_table" "tfer--tfstate-fs-lock-dynamo" {
#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   billing_mode                = "PROVISIONED"
#   deletion_protection_enabled = "false"
#   hash_key                    = "LockID"
#   name                        = "tfstate-fs-lock-dynamo"

#   point_in_time_recovery {
#     enabled = "false"
#   }

#   read_capacity  = "20"
#   stream_enabled = "false"
#   table_class    = "STANDARD"
#   write_capacity = "20"
# }
