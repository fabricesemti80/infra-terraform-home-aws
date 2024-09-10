## 1. Comment-out the backend-block and run "terraform apply" => this will create the state bucket and the dynamoDB table (note: at this point the state file is local!)
## 2. Uncomment the backend-block and run `terraform init --migrate-state' to migrate the state file to s3
## 3. Start using terraform as normal

terraform {
  backend "s3" {
    encrypt = true
    bucket = "tfstate-fs-bucket"
    dynamodb_table = "tfstate-fs-lock-dynamo"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}

locals {
  bucket_name = "tfstate-fs-bucket"
  dynamo_name = "tfstate-fs-lock-dynamo"
}

## Create encrypted kms  key and bucket to store the state file
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket" "tf_state_bucket" {
    bucket = local.bucket_name
    force_destroy = true
}

## Create DynamoDB table to store the state locks

resource "aws_dynamodb_table" "tf_lock_dynamodb" {
  name = local.dynamo_name
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}
