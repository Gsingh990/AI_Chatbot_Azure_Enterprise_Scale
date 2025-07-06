resource_group_name = "rg-iac-gpt-chatbot-new"
location            = "westus"

tags = {
  environment = "dev"
  project     = "iac-gpt-chatbot"
}

key_vault_name = "kv-iac-gpt-chatbot-new" # Changed Key Vault name
# log_analytics_workspace_name = "la-iac-gpt-chatbot"

openai_name = "oai-iac-gpt-chatbot"
openai_sku  = "S0"
openai_model_name = "gpt-35-turbo"
openai_model_version = "0125"
openai_model_deployment_name = "gpt35-turbo-deployment"
openai_model_capacity = 1

cognitive_search_name = "cs-iac-gpt-chatbot"
cognitive_search_sku = "basic"
storage_account_name = "saiacgptchatbot"

bot_name = "bot-iac-gpt-chatbot"
app_service_plan_sku = "B1"
app_service_plan_os_type = "Windows"