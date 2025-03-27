/* -------------------------------------------------------------------------- */
/*                              Resource explorer                             */
/* -------------------------------------------------------------------------- */


resource "aws_resourceexplorer2_index" "aggregator" {
  type    = "AGGREGATOR" # Enables global search
}

resource "aws_resourceexplorer2_view" "aggregator" {
  name = "aggregator-view"

  depends_on = [aws_resourceexplorer2_index.aggregator]
}

/* -------------------------------------------------------------------------- */
/*                                     S3                                     */
/* -------------------------------------------------------------------------- */

resource "aws_s3_bucket_policy" "tfer--billingreportskrapulax" {
  bucket = "billingreportskrapulax"
  policy = "{\"Id\":\"Policy1335892530063\",\"Statement\":[{\"Action\":[\"s3:GetBucketAcl\",\"s3:GetBucketPolicy\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"billingreports.amazonaws.com\"},\"Resource\":\"arn:aws:s3:::billingreportskrapulax\",\"Sid\":\"Stmt1335892150622\"},{\"Action\":\"s3:PutObject\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"billingreports.amazonaws.com\"},\"Resource\":\"arn:aws:s3:::billingreportskrapulax/*\",\"Sid\":\"Stmt1335892526596\"}],\"Version\":\"2008-10-17\"}"
}

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
