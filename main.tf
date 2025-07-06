module "resource_group" {
  source = "./modules/resource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "security" {
  source = "./modules/security"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  key_vault_name      = var.key_vault_name
  tags                = var.tags
}

# module "monitoring" {
#   source = "./modules/monitoring"

#   resource_group_name = module.resource_group.name
#   location            = module.resource_group.location
#   log_analytics_workspace_name = var.log_analytics_workspace_name
#   tags                = var.tags
# }

module "core_ai_services" {
  source = "./modules/core_ai_services"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  openai_name         = var.openai_name
  openai_sku          = var.openai_sku
  openai_model_name   = var.openai_model_name
  openai_model_version = var.openai_model_version
  openai_model_deployment_name = var.openai_model_deployment_name
  openai_model_capacity = var.openai_model_capacity
  tags                = var.tags
}

module "knowledge_base" {
  source = "./modules/knowledge_base"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cognitive_search_name = var.cognitive_search_name
  cognitive_search_sku = var.cognitive_search_sku
  storage_account_name = var.storage_account_name
  tags                = var.tags
}

module "chatbot_infra" {
  source = "./modules/chatbot_infra"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  bot_name            = var.bot_name
  app_service_plan_sku = var.app_service_plan_sku
  openai_endpoint     = module.core_ai_services.openai_endpoint
  openai_api_key      = module.core_ai_services.openai_api_key
  openai_deployment_name = var.openai_model_deployment_name
  key_vault_uri       = module.security.key_vault_uri
  tags                = var.tags
}