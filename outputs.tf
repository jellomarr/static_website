output "s3_website_endpoint" {
  value = aws_s3_bucket_website_configuration.hans_static_website_config.website_endpoint
}