variable "bucket_name" {
  description = "The AWS region to use to create resources."
  }

variable "s3_acl" {
  type        = string
  description = " Defaults to private "
  default     = "private"
}

variable "bucket_force_destroy" {
  description = ""
  type        = bool
  default     = "false"
}

variable "versioning" {
  description = "versioning config"
  type        = string
  default     = "Enabled"
}
