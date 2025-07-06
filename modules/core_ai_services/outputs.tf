output "openai_endpoint" {
  description = "The endpoint of the Azure OpenAI Service."
  value       = azurerm_cognitive_account.openai.endpoint
}

output "openai_api_key" {
  description = "The primary API key for the Azure OpenAI Service."
  value       = azurerm_cognitive_account.openai.primary_access_key
  sensitive   = true
}
