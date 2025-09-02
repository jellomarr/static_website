variable "bucket_name" {
  type        = string
  description = "name of bucket"
}

variable "region" {
  type        = string
  description = "Desired AWS region"
}

variable "profile" {
  type        = string
  description = "Desired AWS profile to use"
}

variable "location_of_static_file" {
  type        = string
  description = "File location of static file"
}