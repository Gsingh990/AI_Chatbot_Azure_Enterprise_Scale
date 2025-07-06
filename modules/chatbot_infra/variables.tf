variable "resource_group_name" {
  description = "The name of the resource group for the chatbot infrastructure."
  type        = string
}

variable "location" {
  description = "The Azure region for the chatbot infrastructure."
  type        = string
}

variable "bot_name" {
  description = "The name of the Azure Bot Service."
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan (e.g., B1, S1, P1v2)."
  type        = string
}

variable "app_service_plan_os_type" {
  description = "The OS type for the App Service Plan (Windows or Linux)."
  type        = string
  default     = "Windows"
}

variable "openai_endpoint" {
  description = "The endpoint URL for the Azure OpenAI Service."
  type        = string
}

variable "openai_api_key" {
  description = "The API key for the Azure OpenAI Service."
  type        = string
  sensitive   = true
}

variable "openai_deployment_name" {
  description = "The deployment name of the OpenAI model to use."
  type        = string
}

variable "key_vault_uri" {
  description = "The URI of the Key Vault to retrieve secrets from."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}