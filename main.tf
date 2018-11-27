# Terraform module which creates AWS Organizations Account resources on AWS.
#
# https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html

# Account management must be done from the organization's master account.
#
# AWS Organizations clones the company name and address information
# for the new account from the organization's master account.
# But, the information required for the account to operate as a standalone account,
# such as a payment method and signing the end user license agreement (EULA) is not automatically collected.
# If you must remove an account from your organization later,
# you can do so only after you provide the missing information.
#
# When you create an account,
# AWS Organizations initially assigns a password to the root user that is a minimum of 64 characters long.
# All characters are randomly generated with no guarantees on the appearance of certain character sets.
# You can't retrieve this initial password. To access the account as the root user for the first time,
# you must go through the process for password recovery.
# https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html#orgs_manage_accounts_access-as-root
#
# WARNING: Deleting this Terraform resource will only remove an AWS account from an organization.
#          Terraform will not close the account. The member account must be prepared to be a standalone account beforehand.
#          See https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_remove.html
#
# https://www.terraform.io/docs/providers/aws/r/organizations_account.html
resource "aws_organizations_account" "default" {
  count = "${var.enabled}"

  # A friendly name for the member account.
  # Minimum length of 1. Maximum length of 50.
  # https://docs.aws.amazon.com/organizations/latest/APIReference/API_CreateAccount.html#organizations-CreateAccount-request-AccountName
  name = "${var.name}"

  # The email address of the owner to assign to the new member account.
  # This email address must not already be associated with another AWS account.
  # You must use a valid email address to complete account creation.
  # You can't access the root user of the account or remove an account that was created with an invalid email address.
  # Minimum length of 6. Maximum length of 64.
  # https://docs.aws.amazon.com/organizations/latest/APIReference/API_CreateAccount.html#organizations-CreateAccount-request-Email
  email = "${var.email}"

  # If set to ALLOW, the new account enables IAM users to access account billing information if they have the required permissions.
  # If set to DENY, only the root user of the new account can access account billing information.
  # Valid value is ALLOW or DENY.
  # https://docs.aws.amazon.com/organizations/latest/APIReference/API_CreateAccount.html#organizations-CreateAccount-request-IamUserAccessToBilling
  iam_user_access_to_billing = "${var.iam_user_access_to_billing}"

  # The name of an IAM role that AWS Organizations automatically preconfigures in the new member account.
  # This role trusts the master account, allowing users in the master account to assume the role,
  # as permitted by the master account administrator. The role has administrator permissions in the new member account.
  # https://docs.aws.amazon.com/organizations/latest/APIReference/API_CreateAccount.html#organizations-CreateAccount-request-RoleName
  role_name = "${var.role_name}"
}
