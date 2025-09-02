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
