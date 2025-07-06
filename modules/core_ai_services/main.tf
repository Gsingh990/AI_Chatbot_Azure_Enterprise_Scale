resource "azurerm_cognitive_account" "openai" {
  name                = var.openai_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "OpenAI"
  sku_name            = var.openai_sku

  tags = var.tags
}

resource "azurerm_cognitive_deployment" "openai_model" {
  name                 = var.openai_model_deployment_name
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = var.openai_model_name
    version = var.openai_model_version
  }

  scale {
    type    = "Standard"
    capacity = var.openai_model_capacity
  }
}

resource "azurerm_cognitive_deployment" "gpt4o_model" {
  count = var.gpt4o_model_name != "" ? 1 : 0

  name                 = var.gpt4o_model_deployment_name
  cognitive_account_id = azurerm_cognitive_account.openai.id

  model {
    format  = "OpenAI"
    name    = var.gpt4o_model_name
    version = var.gpt4o_model_version
  }

  scale {
    type    = "Standard"
    capacity = var.gpt4o_model_capacity
  }
}