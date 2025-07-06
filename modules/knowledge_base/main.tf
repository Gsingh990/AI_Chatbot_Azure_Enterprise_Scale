resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

resource "azurerm_search_service" "main" {
  name                = var.cognitive_search_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.cognitive_search_sku
  tags                = var.tags
}
