resource "aws_s3_bucket" "bucket" {
  bucket        = "${var.prefix}-${var.environment}"
  force_destroy = var.force_destroy

  tags = merge(
    {
      Name        = "${var.prefix}-${var.environment}"
      Environment = var.environment
      CostCenter  = var.cost_center
    },
    var.additional_tags
  )
}

resource "aws_s3_bucket_acl" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.versioning ? "Enabled" : "Disabled"
  }
}
