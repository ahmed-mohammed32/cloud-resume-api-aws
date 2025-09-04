# Create an S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  tags          = var.tags
}

# Create a DynamoDB table
resource "aws_dynamodb_table" "dynamodb_table" {
  name         = var.dynamodb_table_name
  hash_key     = "id"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "id"
    type = "S"
  }
  tags = var.tags
}

# Create a Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name    = var.lambda_name
  description      = var.lambda_description
  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.lambda_zip.output_path)   # Ensure the hash is updated when the python code changes
  runtime          = "python3.12"
  handler          = "lambda.lambda_handler"
  role             = aws_iam_role.lambda_exec_role.arn
  environment {
    variables = {
      TABLE_NAME  = aws_dynamodb_table.dynamodb_table.name
      BUCKET_NAME = aws_s3_bucket.s3_bucket.bucket
    }
  }
  tags = var.tags
}

# Get the archived from Lambda function and Zip it
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda/lambda.zip"
}


# Create a Lambda function URL
resource "aws_lambda_function_url" "lambda_function_url" {
  function_name      = aws_lambda_function.lambda_function.function_name
  authorization_type = "NONE"
}
