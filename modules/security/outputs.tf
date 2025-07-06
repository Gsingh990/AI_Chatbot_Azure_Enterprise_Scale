output "key_vault_id" {
  description = "The ID of the Key Vault."
  value       = azurerm_key_vault.main.id
}

output "key_vault_uri" {
  description = "The URI of the Key Vault."
  value       = azurerm_key_vault.main.vault_uri
}

output "gemini_api_key_secret_uri" {
  description = "The URI of the Gemini API Key secret in Key Vault."
  value       = var.gemini_api_key != "" ? azurerm_key_vault_secret.gemini_api_key[0].id : null
  sensitive   = true
}

output "claude_api_key_secret_uri" {
  description = "The URI of the Claude API Key secret in Key Vault."
  value       = var.claude_api_key != "" ? azurerm_key_vault_secret.claude_api_key[0].id : null
  sensitive   = true
}