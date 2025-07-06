variable "resource_group_name" {
  description = "The name of the resource group for Azure OpenAI."
  type        = string
}

variable "location" {
  description = "The Azure region for Azure OpenAI."
  type        = string
}

variable "openai_name" {
  description = "The name of the Azure OpenAI Service resource."
  type        = string
}

variable "openai_sku" {
  description = "The SKU for Azure OpenAI Service."
  type        = string
}

variable "openai_model_name" {
  description = "The name of the OpenAI model to deploy (e.g., gpt-4, gpt-35-turbo)."
  type        = string
}

variable "openai_model_version" {
  description = "The version of the OpenAI model to deploy."
  type        = string
}

variable "openai_model_deployment_name" {
  description = "The name of the deployment for the OpenAI model."
  type        = string
}

variable "openai_model_capacity" {
  description = "The capacity for the OpenAI model deployment."
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
