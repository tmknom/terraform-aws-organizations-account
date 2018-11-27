# terraform-aws-organizations-account

[![CircleCI](https://circleci.com/gh/tmknom/terraform-aws-organizations-account.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-aws-organizations-account)
[![GitHub tag](https://img.shields.io/github/tag/tmknom/terraform-aws-organizations-account.svg)](https://registry.terraform.io/modules/tmknom/organizations-account/aws)
[![License](https://img.shields.io/github/license/tmknom/terraform-aws-organizations-account.svg)](https://opensource.org/licenses/Apache-2.0)

Terraform module which creates AWS Organizations Account resources on AWS.

## Description

Provision [AWS Account](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts.html).

This module provides recommended settings:

- Enable access to billing
- Use OrganizationAccountAccessRole

## Usage

### Minimal

```hcl
module "organizations_account" {
  source = "git::https://github.com/tmknom/terraform-aws-organizations-account.git?ref=tags/1.0.0"
  name   = "example"
  email  = "minimal@example.com"
}
```

### Complete

```hcl
module "organizations_account" {
  source = "git::https://github.com/tmknom/terraform-aws-organizations-account.git?ref=tags/1.0.0"
  name   = "example"
  email  = "complete@example.com"

  iam_user_access_to_billing = "DENY"
  role_name                  = "OrganizationAccoLuntAccessRole"
  enabled                    = true
}
```

## Examples

- [Minimal](https://github.com/tmknom/terraform-aws-organizations-account/tree/master/examples/minimal)
- [Complete](https://github.com/tmknom/terraform-aws-organizations-account/tree/master/examples/complete)

## Inputs

| Name                       | Description                                                                                       |  Type  |             Default              | Required |
| -------------------------- | ------------------------------------------------------------------------------------------------- | :----: | :------------------------------: | :------: |
| email                      | The email address of the owner to assign to the new member account.                               | string |                -                 |   yes    |
| name                       | A friendly name for the member account.                                                           | string |                -                 |   yes    |
| enabled                    | Set to false to prevent the module from creating anything.                                        | string |              `true`              |    no    |
| iam_user_access_to_billing | If set to ALLOW, the new account enables IAM users to access account billing information.         | string |             `ALLOW`              |    no    |
| role_name                  | The name of an IAM role that Organizations automatically preconfigures in the new member account. | string | `OrganizationAccoLuntAccessRole` |    no    |

## Outputs

| Name                       | Description               |
| -------------------------- | ------------------------- |
| organizations_account_arn  | The ARN for this account. |
| organizations_account_id   | The AWS account id.       |
| organizations_account_name | The AWS account name.     |

## Development

### Requirements

- [Docker](https://www.docker.com/)

### Configure environment variables

```shell
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=ap-northeast-1
```

### Installation

```shell
git clone git@github.com:tmknom/terraform-aws-organizations-account.git
cd terraform-aws-organizations-account
make install
```

### Makefile targets

```text
check-format                   Check format code
cibuild                        Execute CI build
clean                          Clean .terraform
docs                           Generate docs
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release GitHub and Terraform Module Registry
terraform-apply-complete       Run terraform apply examples/complete
terraform-apply-minimal        Run terraform apply examples/minimal
terraform-destroy-complete     Run terraform destroy examples/complete
terraform-destroy-minimal      Run terraform destroy examples/minimal
terraform-plan-complete        Run terraform plan examples/complete
terraform-plan-minimal         Run terraform plan examples/minimal
upgrade                        Upgrade makefile
```

### Releasing new versions

Bump VERSION file, and run `make release`.

### Terraform Module Registry

- <https://registry.terraform.io/modules/tmknom/organizations-account/aws>

## License

Apache 2 Licensed. See LICENSE for full details.
