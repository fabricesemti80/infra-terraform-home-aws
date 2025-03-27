resource "aws_s3_bucket_policy" "tfer--billingreportskrapulax" {
  bucket = "billingreportskrapulax"
  policy = "{\"Id\":\"Policy1335892530063\",\"Statement\":[{\"Action\":[\"s3:GetBucketAcl\",\"s3:GetBucketPolicy\"],\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"billingreports.amazonaws.com\"},\"Resource\":\"arn:aws:s3:::billingreportskrapulax\",\"Sid\":\"Stmt1335892150622\"},{\"Action\":\"s3:PutObject\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"billingreports.amazonaws.com\"},\"Resource\":\"arn:aws:s3:::billingreportskrapulax/*\",\"Sid\":\"Stmt1335892526596\"}],\"Version\":\"2008-10-17\"}"
}
