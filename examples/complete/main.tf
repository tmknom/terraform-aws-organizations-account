module "organizations_account" {
  source = "../../"
  name   = "example"
  email  = "complete@example.com"

  iam_user_access_to_billing = "DENY"
  role_name                  = "OrganizationAccountAccessRole"
  enabled                    = true
}
