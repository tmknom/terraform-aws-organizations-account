output "organizations_account_arn" {
  value       = "${join("", aws_organizations_account.default.*.arn)}"
  description = "The ARN for this account."
}

output "organizations_account_id" {
  value       = "${join("", aws_organizations_account.default.*.id)}"
  description = "The AWS account id."
}

output "organizations_account_name" {
  value       = "${join("", aws_organizations_account.default.*.name)}"
  description = "The AWS account name."
}
