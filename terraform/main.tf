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

# Create a Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name = var.function_name
  description   = var.lambda_description
  filename      = "../lambda.py"
  runtime       = "python3.12"
  handler       = "lambda.lambda_handler"
  role          = aws_iam_role.lambda_exec_role.arn
  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.dynamodb_table.name
      BUCKET_NAME = aws_s3_bucket.s3_bucket.bucket
    }
  }
  tags = var.tags
}
