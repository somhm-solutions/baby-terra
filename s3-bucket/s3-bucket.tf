module "private_s3_bucket" {
  source = "yukihira1992/s3-private-bucket/aws"

  # Name of s3 bucket to be created
  bucket = "${var.bucket_name}"
  region = "${var.region}"
  versioning_enabled = true
  sse_algorithm = "AES256"
  tags = {
    environment = "dev"

  }
}