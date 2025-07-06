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

variable "gemini_api_key" {
  description = "The API key for Google Gemini LLM. Will be stored in Key Vault."
  type        = string
  default     = "" # Provide your actual Gemini API key here
  sensitive   = true
}

variable "claude_api_key" {
  description = "The API key for Anthropic Claude LLM. Will be stored in Key Vault."
  type        = string
  default     = "" # Provide your actual Claude API key here
  sensitive   = true
}