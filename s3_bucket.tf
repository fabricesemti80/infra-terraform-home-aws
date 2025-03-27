resource "aws_s3_bucket" "tfer--billingreportskrapulax" {
  bucket        = "billingreportskrapulax"
  force_destroy = "false"

  grant {
    id          = "7c01473d3d46149fe62250c0d8d22aceb631d8dc2acdca88abca3dc58b6dd91a"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Id": "Policy1335892530063",
  "Statement": [
    {
      "Action": [
        "s3:GetBucketAcl",
        "s3:GetBucketPolicy"
      ],
      "Effect": "Allow",
      "Principal": {
        "Service": "billingreports.amazonaws.com"
      },
      "Resource": "arn:aws:s3:::billingreportskrapulax",
      "Sid": "Stmt1335892150622"
    },
    {
      "Action": "s3:PutObject",
      "Effect": "Allow",
      "Principal": {
        "Service": "billingreports.amazonaws.com"
      },
      "Resource": "arn:aws:s3:::billingreportskrapulax/*",
      "Sid": "Stmt1335892526596"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

# resource "aws_s3_bucket" "tfer--my-tf-test-bucket-hxzq4g213ji4a36a" {
#   bucket        = "my-tf-test-bucket-hxzq4g213ji4a36a"
#   force_destroy = "false"

#   grant {
#     id          = "7c01473d3d46149fe62250c0d8d22aceb631d8dc2acdca88abca3dc58b6dd91a"
#     permissions = ["FULL_CONTROL"]
#     type        = "CanonicalUser"
#   }

#   object_lock_enabled = "false"
#   request_payer       = "BucketOwner"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }

#       bucket_key_enabled = "false"
#     }
#   }

#   tags = {
#     Environment = "Dev"
#     Name        = "My bucket"
#   }

#   tags_all = {
#     Environment = "Dev"
#     Name        = "My bucket"
#   }

#   versioning {
#     enabled    = "false"
#     mfa_delete = "false"
#   }
# }

# resource "aws_s3_bucket" "tfer--tfstate-fs-bucket" {
#   bucket        = "tfstate-fs-bucket"
#   force_destroy = "false"

#   grant {
#     id          = "7c01473d3d46149fe62250c0d8d22aceb631d8dc2acdca88abca3dc58b6dd91a"
#     permissions = ["FULL_CONTROL"]
#     type        = "CanonicalUser"
#   }

#   object_lock_enabled = "false"
#   request_payer       = "BucketOwner"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = "arn:aws:kms:eu-west-2:199240625156:key/7c14f589-c544-498e-99b0-f2795f004807"
#         sse_algorithm     = "aws:kms"
#       }

#       bucket_key_enabled = "false"
#     }
#   }

#   versioning {
#     enabled    = "false"
#     mfa_delete = "false"
#   }
# }
