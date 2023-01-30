output "ses_domain_identity_arn" {
  value       = aws_ses_domain_identity.this.arn
  description = "The ARN of domain identity"
}

output "route53_records" {
  value = [for token in aws_ses_domain_dkim.this.dkim_tokens : {
    name    = "${token}._domainkey"
    type    = "CNAME"
    ttl     = "600"
    records = ["${token}.dkim.amazonses.com"]
  }]
  description = "List route53 records for dkim tokens"
}
