# AWS SES Terraform module

Terraform module which creates SES domain identity resources on AWS.

## TODO

- [ ] Update README.md
- [ ] Add examples
- [ ] Add Github Wrokflows

## Usage

```hcl
module "ses" {
  source  = "rabiloo/ses/aws"
  version = "~> 0.1.0"

  domain = "example.com"
}
```

## Requirements

| Name | Version |
|------|---------|
| Terraform | `~> 1.0` |

## Providers

| Name | Version |
|------|---------|
| aws  | `~> 3.52` |

## Resources



## Inputs

## Outputs

## Contributing

All code contributions must go through a pull request and approved by a core developer before being merged. 
This is to ensure proper review of all the code.

Fork the project, create a feature branch, and send a pull request.

If you would like to help take a look at the [list of issues](https://github.com/rabiloo/terraform-aws-ses/issues).

## License

This project is released under the MIT License.   
Copyright © 2021 [Rabiloo Co., Ltd](https://rabiloo.com)   
Please see [License File](LICENSE) for more information.
