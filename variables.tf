variable "resource_group_name" {
  description = "The name of the resource group for the IaC-GPT Chatbot."
  type        = string
  default     = "rg-iac-gpt-chatbot"
}

variable "location" {
  description = "The Azure region to deploy resources into."
  type        = string
  default     = "westus"
}

variable "tags" {
  description = "A map of tags to assign to all resources."
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "iac-gpt-chatbot"
  }
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
  default     = "kv-iac-gpt-chatbot"
}

# variable "log_analytics_workspace_name" {
#   description = "The name of the Log Analytics Workspace."
#   type        = string
#   default     = "la-iac-gpt-chatbot"
# }

variable "openai_name" {
  description = "The name of the Azure OpenAI Service resource."
  type        = string
  default     = "oai-iac-gpt-chatbot"
}

variable "openai_sku" {
  description = "The SKU for Azure OpenAI Service."
  type        = string
  default     = "S0"
}

variable "openai_model_name" {
  description = "The name of the OpenAI model to deploy (e.g., gpt-4, gpt-35-turbo)."
  type        = string
  default     = "gpt-35-turbo"
}

variable "openai_model_version" {
  description = "The version of the OpenAI model to deploy."
  type        = string
  default     = "0125"
}

variable "openai_model_deployment_name" {
  description = "The name of the deployment for the OpenAI model."
  type        = string
  default     = "gpt35-turbo-deployment"
}

variable "openai_model_capacity" {
  description = "The capacity for the OpenAI model deployment."
  type        = number
  default     = 1
}

variable "gpt4o_model_name" {
  description = "The name of the GPT-4o model to deploy."
  type        = string
  default     = "gpt-4o"
}

variable "gpt4o_model_version" {
  description = "The version of the GPT-4o model to deploy."
  type        = string
  default     = "2024-05-13"
}

variable "gpt4o_model_deployment_name" {
  description = "The name of the deployment for the GPT-4o model."
  type        = string
  default     = "gpt4o-deployment"
}

variable "gpt4o_model_capacity" {
  description = "The capacity for the GPT-4o model deployment."
  type        = number
  default     = 1
}

variable "cognitive_search_name" {
  description = "The name of the Azure Cognitive Search service."
  type        = string
  default     = "cs-iac-gpt-chatbot"
}

variable "cognitive_search_sku" {
  description = "The SKU for Azure Cognitive Search (e.g., basic, standard, standard2)."
  type        = string
  default     = "basic"
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account for knowledge base."
  type        = string
  default     = "saiacgptchatbot"
}

variable "bot_name" {
  description = "The name of the Azure Bot Service."
  type        = string
  default     = "bot-iac-gpt-chatbot"
}

variable "app_service_plan_sku" {
  description = "The SKU for the App Service Plan (e.g., B1, S1, P1v2)."
  type        = string
  default     = "B1"
}

variable "app_service_plan_os_type" {
  description = "The OS type for the App Service Plan (Windows or Linux)."
  type        = string
  default     = "Windows"
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