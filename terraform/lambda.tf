# Lambda module for reusability (if needed in future)
module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  version = "~> 5.0"

  function_name = var.function_name
  description   = var.lambda_description
  handler       = "lambda.lambda_handler"
  runtime       = "python3.12"

  source_path = "../lambda.py"

  tags = var.tags
}
