variable "resource_group_name" {
  description = "The name of the resource group for the Key Vault."
  type        = string
}

variable "location" {
  description = "The Azure region for the Key Vault."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Key Vault."
  type        = map(string)
  default     = {}
}
