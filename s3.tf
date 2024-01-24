
# resource "aws_s3_bucket" "s3_sample" {
#   bucket = "bucket-from-terraform"
#   tags = {
#     Name = "Terraform-S3-deploy"
#     Enviroment = "QA"
#   }

#   website {
#     index_document = "index.html"
#     error_document = "error.html"
#   }
# }