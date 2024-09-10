terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
}
provider "aws" {
  # Configuration options
}
resource "aws_s3_bucket" "default" {
  bucket = "my-magus-111-bckt"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.bucket # Reference the bucket name
  key    = "myfile.txt"                 # The file name to use in S3
  source = "myfile.txt"                 # The local file to upload

  #    etag
  etag = filemd5("myfile.txt")
}
