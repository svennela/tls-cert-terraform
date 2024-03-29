variable "private_key_algorithm" {
  description = "The name of the algorithm to use for private keys. Must be one of: RSA or ECDSA."
  type        = string
  default     = "RSA"
}

variable "private_key_ecdsa_curve" {
  description = "The name of the elliptic curve to use. Should only be used if var.private_key_algorithm is ECDSA. Must be one of P224, P256, P384 or P521."
  type        = string
  default     = "P256"
}

variable "private_key_rsa_bits" {
  description = "The size of the generated RSA key in bits. Should only be used if var.private_key_algorithm is RSA."
  type        = number
  default     = 2048

}



variable "owner" {
  description = "The OS user who should be given ownership over the certificate files."
  type        = string
  default     = "svennela"
}

variable "organization_name" {
  description = "The name of the organization to associate with the certificates (e.g. Acme Co)."
  type        = string
  default     = "cloudnativeapps inc"
}

variable "ca_common_name" {
  description = "The common name to use in the subject of the CA certificate (e.g. acme.co cert)."
  type        = string
  default     = "cloudnativeapps.com"
}

variable "common_name" {
  description = "The common name to use in the subject of the certificate (e.g. acme.co cert)."
  type        = string
  default     = "cloudnativeapps.com"
}

variable "dns_names" {
  description = "List of DNS names for which the certificate will be valid (e.g. foo.example.com)."
  type        = list(string)
  default     = ["cloudnativeapps.com", "cloudnativeapps.net"]
}

variable "ip_addresses" {
  description = "List of IP addresses for which the certificate will be valid (e.g. 127.0.0.1)."
  type        = list(string)
  default     = ["127.0.0.1"]
}

variable "validity_period_hours" {
  description = "The number of hours after initial issuing that the certificate will become invalid."
  type        = number
  default     = 3600
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the CA certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type        = list(string)

  default = [
    "cert_signing",
    "key_encipherment",
    "digital_signature",
  ]
}

variable "allowed_uses" {
  description = "List of keywords from RFC5280 describing a use that is permitted for the issued certificate. For more info and the list of keywords, see https://www.terraform.io/docs/providers/tls/r/self_signed_cert.html#allowed_uses."
  type        = list(string)

  default = [
    "key_encipherment",
    "digital_signature",
  ]
}

variable "permissions" {
  description = "The Unix file permission to assign to the cert files (e.g. 0600)."
  type        = number
  default     = 0600
}

# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "ca_public_key_file_path" {
  description = "Write the PEM-encoded CA certificate public key to this path (e.g. /etc/tls/ca.crt.pem)."
  type        = string
  default     = "./certs/ca/crt.pem"
}

variable "public_key_file_path" {
  description = "Write the PEM-encoded certificate public key to this path (e.g. /etc/tls/cloudapps.crt.pem)."
  type        = string
  default     = "./certs/tls/cloudapps.crt.pem"
}

variable "private_key_file_path" {
  description = "Write the PEM-encoded certificate private key to this path (e.g. /etc/tls/cloudapps.key.pem)."
  type        = string
  default     = "./certs/tls/cloudapps.key.pem"
}
