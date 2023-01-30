config {
  module = true
}

plugin "aws" {
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
  version = "0.21.1"
  enabled = true
}
