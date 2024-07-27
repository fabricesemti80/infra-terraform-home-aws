
resource "random_string" "random" {
  length           = 16
  special          = false
  upper            = false
  override_special = "/@£$"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-${random_string.random.result}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}