variable "name" {
  type        = "string"
  description = "A friendly name for the member account."
}

variable "email" {
  type        = "string"
  description = "The email address of the owner to assign to the new member account."
}

variable "iam_user_access_to_billing" {
  default     = "ALLOW"
  type        = "string"
  description = "If set to ALLOW, the new account enables IAM users to access account billing information."
}

variable "role_name" {
  default     = "OrganizationAccoLuntAccessRole"
  type        = "string"
  description = "The name of an IAM role that Organizations automatically preconfigures in the new member account."
}

variable "enabled" {
  default     = true
  type        = "string"
  description = "Set to false to prevent the module from creating anything."
}
