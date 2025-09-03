variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
  default     = "cloud-resume-api-aws-bucket"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table name"
  type        = string
  default     = "cloud-resume-api-aws-table"
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default = {
    name        = "cloud-resume-api-aws"
    environment = "dev"
  }
}

variable "lambda_name" {
  description = "Lambda function name"
  type        = string
  default     = "cloud-resume-api-aws-lambda"
}

variable "lambda_description" {
  description = "Description of the Lambda function"
  type        = string
  default     = "Lambda function for Cloud Resume API"
}
