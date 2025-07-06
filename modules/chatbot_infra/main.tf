resource "azurerm_service_plan" "main" {
  name                = "${var.bot_name}-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = var.app_service_plan_os_type

  sku_name = var.app_service_plan_sku

  tags = var.tags
}

resource "azurerm_windows_web_app" "main" {
  name                = "${var.bot_name}-app"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true

  site_config {
    always_on = true
    # python_version is deprecated and removed
    # app_command_line is typically set by the deployment process or startup file
  }

  app_settings = {
    "OpenAiEndpoint"       = var.openai_endpoint
    "OpenAiApiKey"         = var.openai_api_key
    "OpenAiDeploymentName" = var.openai_deployment_name
    "KeyVaultUri"          = var.key_vault_uri
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = "true" # Required for Python apps
    "GeminiApiKeySecretUri" = var.gemini_api_key_secret_uri != null ? var.gemini_api_key_secret_uri : ""
    "ClaudeApiKeySecretUri" = var.claude_api_key_secret_uri != null ? var.claude_api_key_secret_uri : ""
    "Gpt4oDeploymentName"   = var.gpt4o_deployment_name != null ? var.gpt4o_deployment_name : ""
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

# azurerm_app_service_zip_deployment resource is deprecated and removed.
# Application code deployment should be handled by CI/CD or Azure CLI after infrastructure provisioning.

resource "azurerm_bot_service_azure_bot" "main" {
  name                = var.bot_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "F0"
  display_name        = var.bot_name
  microsoft_app_id    = azurerm_windows_web_app.main.identity[0].principal_id # Using App Service Managed Identity

  tags = var.tags
}
