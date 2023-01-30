resource "aws_ses_domain_identity" "this" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
  depends_on = [
    aws_ses_domain_identity.this,
  ]
}

data "aws_route53_zone" "this" {
  count = var.create_route53_records ? 1 : 0
  name  = var.domain
}

resource "aws_route53_record" "dkim_record" {
  # length(aws_ses_domain_dkim.this.dkim_tokens) = 3
  count = var.create_route53_records ? 3 : 0

  zone_id = data.aws_route53_zone.this[0].zone_id
  name    = "${element(aws_ses_domain_dkim.this.dkim_tokens, count.index)}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${element(aws_ses_domain_dkim.this.dkim_tokens, count.index)}.dkim.amazonses.com"]

  depends_on = [
    aws_ses_domain_dkim.this,
  ]
}

data "aws_iam_policy_document" "sendonly" {
  count = length(var.sendonly_access_principals) > 0 ? 1 : 0

  statement {
    sid    = "SendonlyAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.sendonly_access_principals
    }

    actions = [
      "ses:SendEmail",
      "ses:SendRawEmail",
    ]

    resources = [aws_ses_domain_identity.this.arn]
  }
}

data "aws_iam_policy_document" "full" {
  count = length(var.full_access_principals) > 0 ? 1 : 0

  statement {
    sid    = "FullAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.full_access_principals
    }

    actions   = ["ses:*"]
    resources = [aws_ses_domain_identity.this.arn]
  }
}

data "aws_iam_policy_document" "resource" {
  source_policy_documents   = data.aws_iam_policy_document.sendonly[*].json
  override_policy_documents = data.aws_iam_policy_document.full[*].json
}

resource "aws_ses_identity_policy" "policy" {
  count = length(var.sendonly_access_principals) + length(var.full_access_principals) > 0 ? 1 : 0

  identity = aws_ses_domain_identity.this.arn
  name     = "${replace(var.domain, ".", "-")}-identity-policy"
  policy   = data.aws_iam_policy_document.resource.json
}
