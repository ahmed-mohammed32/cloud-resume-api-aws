# Create an S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
  tags   = var.tags
}

# Create a DynamoDB table
resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb_table_name
  hash_key     = "name"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "name"
    type = "S"
  }
  tags = var.tags
}
