output "bot_service_id" {
  description = "The ID of the Azure Bot Service."
  value       = azurerm_bot_service_azure_bot.main.id
}

output "app_service_url" {
  description = "The URL of the App Service hosting the bot."
  value       = azurerm_windows_web_app.main.default_hostname
}

output "app_service_principal_id" {
  description = "The Principal ID of the App Service Managed Identity."
  value       = azurerm_windows_web_app.main.identity[0].principal_id
}