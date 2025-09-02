resource "aws_s3_bucket" "hans_static_website_bucket" {
  bucket = var.bucket_name

  tags = {
    Name  = var.bucket_name
  }
}

resource "aws_s3_bucket_website_configuration" "hans_static_website_config" {
  bucket = aws_s3_bucket.hans_static_website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block_settings" {
  bucket = aws_s3_bucket.hans_static_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "iam-bucket-policy" {
  statement {
    sid    = "AllowPublicRead"
    effect = "Allow"

    actions = ["s3:GetObject"]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.hans_static_website_bucket.id}/*",
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

  depends_on = [ aws_s3_bucket_public_access_block.public_access_block_settings ]
}

resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.hans_static_website_bucket.id
  policy = data.aws_iam_policy_document.iam-bucket-policy.json
  depends_on = [ aws_s3_bucket_public_access_block.public_access_block_settings ]
}

#This is the static web page file
resource "aws_s3_object" "static_website" {
  bucket = aws_s3_bucket.hans_static_website_bucket.id
  key    = "index.html"
  source = var.location_of_static_file
  content_type = "text/html"
}