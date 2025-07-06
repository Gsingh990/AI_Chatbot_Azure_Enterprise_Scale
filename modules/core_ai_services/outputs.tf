output "openai_endpoint" {
  description = "The endpoint of the Azure OpenAI Service."
  value       = azurerm_cognitive_account.openai.endpoint
}

output "openai_api_key" {
  description = "The primary API key for the Azure OpenAI Service."
  value       = azurerm_cognitive_account.openai.primary_access_key
  sensitive   = true
}

output "gpt4o_deployment_name" {
  description = "The deployment name of the GPT-4o model."
  value       = var.gpt4o_model_name != "" ? azurerm_cognitive_deployment.gpt4o_model[0].name : null
}