# DynamoDB module for reusability (if needed in future)
module "dynamodb_table" {
  source       = "terraform-aws-modules/dynamodb-table/aws"
  version      = "~> 5.0"
  name         = var.dynamodb_table_name
  hash_key     = "name"
  billing_mode = "PAY_PER_REQUEST"
  attributes = [
    {
      name = "name"
      type = "S"
    }
  ]

  tags = var.tags
}
