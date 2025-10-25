# OPTIONAL: S3 backend config for remote state. Uncomment and fill values for production.
# terraform {
#   backend "s3" {
#     bucket         = "YOUR_TERRAFORM_STATE_BUCKET"
#     key            = "project-bedrock/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "YOUR_TF_STATE_LOCK_TABLE"
#     encrypt        = true
#   }
# }
