resource_group_name = "rg-iac-gpt-chatbot-new"
location            = "westus"

tags = {
  environment = "dev"
  project     = "iac-gpt-chatbot"
}

key_vault_name = "kv-iac-gpt-chatbot"
# log_analytics_workspace_name = "la-iac-gpt-chatbot"

openai_name = "oai-iac-gpt-chatbot"
openai_sku  = "S0"
openai_model_name = "gpt-35-turbo"
openai_model_version = "0125"
openai_model_deployment_name = "gpt35-turbo-deployment"
openai_model_capacity = 1

gpt4o_model_name = "gpt-4o"
gpt4o_model_version = "2024-05-13"
gpt4o_model_deployment_name = "gpt4o-deployment"
gpt4o_model_capacity = 1

cognitive_search_name = "cs-iac-gpt-chatbot"
cognitive_search_sku = "basic"
storage_account_name = "saiacgptchatbot"

bot_name = "bot-iac-gpt-chatbot"
app_service_plan_sku = "B1"
app_service_plan_os_type = "Windows"

gemini_api_key = "" # Replace with your actual Gemini API key
claude_api_key = "" # Replace with your actual Claude API key