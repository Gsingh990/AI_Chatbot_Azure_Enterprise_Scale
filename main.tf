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
  key_vault_name      = "${var.key_vault_name}-${random_id.suffix.hex}"
  gemini_api_key      = var.gemini_api_key
  claude_api_key      = var.claude_api_key
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
  openai_name         = "${var.openai_name}-${random_id.suffix.hex}"
  openai_sku          = var.openai_sku
  openai_model_name   = var.openai_model_name
  openai_model_version = var.openai_model_version
  openai_model_deployment_name = var.openai_model_deployment_name
  openai_model_capacity = var.openai_model_capacity
  gpt4o_model_name    = var.gpt4o_model_name
  gpt4o_model_version = var.gpt4o_model_version
  gpt4o_model_deployment_name = var.gpt4o_model_deployment_name
  gpt4o_model_capacity = var.gpt4o_model_capacity
  tags                = var.tags
}

module "knowledge_base" {
  source = "./modules/knowledge_base"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  cognitive_search_name = "${var.cognitive_search_name}-${random_id.suffix.hex}"
  cognitive_search_sku = var.cognitive_search_sku
  storage_account_name = "${var.storage_account_name}${random_id.suffix.hex}"
  tags                = var.tags
}

module "chatbot_infra" {
  source = "./modules/chatbot_infra"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  bot_name            = "${var.bot_name}-${random_id.suffix.hex}"
  app_service_plan_sku = var.app_service_plan_sku
  app_service_plan_os_type = var.app_service_plan_os_type
  openai_endpoint     = module.core_ai_services.openai_endpoint
  openai_api_key      = module.core_ai_services.openai_api_key
  openai_deployment_name = var.openai_model_deployment_name
  gpt4o_deployment_name = module.core_ai_services.gpt4o_deployment_name
  key_vault_uri       = module.security.key_vault_uri
  gemini_api_key_secret_uri = module.security.gemini_api_key_secret_uri
  claude_api_key_secret_uri = module.security.claude_api_key_secret_uri
  tags                = var.tags
}