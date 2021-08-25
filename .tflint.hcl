config {
  module = true
}

plugin "aws" {
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  version = "0.6.0"
  enabled = true
}
