# S3 module for reusability (if needed in future)
# module "s3_bucket" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "~> 5.0"

#   bucket        = var.bucket_name
#   create_bucket = true
#   acl           = null

#   control_object_ownership = true
#   object_ownership         = "BucketOwnerEnforced"

#   versioning = {
#     enabled = true
#   }
# }
