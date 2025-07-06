resource "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled = false

  tags = var.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id # Grant current user/SP access

    key_permissions = [
      "Get", "List", "Create", "Delete", "Purge", "Recover", "Backup", "Restore"
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Purge", "Recover", "Backup", "Restore"
    ]

    certificate_permissions = [
      "Get", "List", "Create", "Delete", "Purge", "Recover", "Backup", "Restore"
    ]
  }
}

data "azurerm_client_config" "current" {}
