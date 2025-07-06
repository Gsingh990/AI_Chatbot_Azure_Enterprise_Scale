output "cognitive_search_id" {
  description = "The ID of the Azure Cognitive Search service."
  value       = azurerm_search_service.main.id
}

output "cognitive_search_query_key" {
  description = "A query key for the Azure Cognitive Search service."
  value       = azurerm_search_service.main.query_keys[0].key
  sensitive   = true
}

output "storage_account_id" {
  description = "The ID of the Azure Storage Account."
  value       = azurerm_storage_account.main.id
}

output "storage_account_primary_access_key" {
  description = "The primary access key for the Azure Storage Account."
  value       = azurerm_storage_account.main.primary_access_key
  sensitive   = true
}