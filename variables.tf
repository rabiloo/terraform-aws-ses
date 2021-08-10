variable "domain" {
  description = "The domain name"
  type        = string

  validation {
    condition     = var.domain != ""
    error_message = "The domain name MUST be not emplty."
  }
  validation {
    condition     = var.domain == replace(var.domain, "/[^a-z0-9-.]+/", "")
    error_message = "The domain name is invalid."
  }
}

variable "full_access_principals" {
  description = "Principal ARNs to provide with full access to the SES"
  type        = list(string)
  default     = []
}

variable "sendonly_access_principals" {
  description = "Principal ARNs to provide with sendonly access to the SES"
  type        = list(string)
  default     = []
}
