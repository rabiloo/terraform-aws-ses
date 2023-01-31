# AWS SES Terraform module

Terraform module which creates SES domain identity resources on AWS.

## Usage

```hcl
module "ses" {
  source  = "rabiloo/ses/aws"
  version = "~>0.2.0"

  domain = "example.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~>4.52 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.52.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.dkim_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ses_domain_dkim.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_dkim) | resource |
| [aws_ses_domain_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |
| [aws_ses_identity_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_identity_policy) | resource |
| [aws_iam_policy_document.full](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.resource](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sendonly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | The domain name | `string` | n/a | yes |
| <a name="input_create_route53_records"></a> [create\_route53\_records](#input\_create\_route53\_records) | Principal ARNs to provide with sendonly access to the SES | `bool` | `true` | no |
| <a name="input_full_access_principals"></a> [full\_access\_principals](#input\_full\_access\_principals) | Principal ARNs to provide with full access to the SES | `list(string)` | `[]` | no |
| <a name="input_sendonly_access_principals"></a> [sendonly\_access\_principals](#input\_sendonly\_access\_principals) | Principal ARNs to provide with sendonly access to the SES | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route53_records"></a> [route53\_records](#output\_route53\_records) | List route53 records for dkim tokens |
| <a name="output_ses_domain_identity_arn"></a> [ses\_domain\_identity\_arn](#output\_ses\_domain\_identity\_arn) | The ARN of domain identity |
<!-- END_TF_DOCS -->

## Development

1. Install `terrform`, `tflint`, `terraform-docs` and `make`
2. Using make

```
make help
```

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/rabiloo/terraform-aws-ses/issues).

## License

This project is released under the MIT License.   
Copyright © 2023 [Rabiloo Co., Ltd](https://rabiloo.com)   
Please see [License File](LICENSE) for more information.
