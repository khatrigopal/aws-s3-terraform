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
variable "s3_block_public_acls" {
  description = "s3_block_public_acls"
  type        = bool
  default     = true
}
variable "s3_block_public_policy" {
  description = "s3_block_public_policy"
  type        = bool
  default     = true
}
variable "s3_ignore_public_acls" {
  description = "s3_ignore_public_acls"
  type        = bool
  default     = true
}
variable "s3_restrict_public_buckets" {
  description = "s3_restrict_public_buckets"
  type        = bool
  default     = true
}

################### ECR ###############

variable "ecr_name" {
  description = "The list of ecr names to create"
  type        = list(string)
  default     = null
}
variable "tags" {
  description = "The key-value maps for tagging"
  type        = map(string)
  default     = {}
}
variable "image_mutability" {
  description = "Provide image mutability"
  type        = string
  default     = "MUTABLE"
}

variable "encrypt_type" {
  description = "Provide type of encryption here"
  type        = string
  default     = "KMS"
}
