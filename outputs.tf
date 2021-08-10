output "ses_domain_identity_arn" {
  value       = aws_ses_domain_identity.this.arn
  description = "The ARN of domain identity"
}
