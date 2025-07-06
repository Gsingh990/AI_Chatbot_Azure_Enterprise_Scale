# IaC-GPT Chatbot Infrastructure (Terraform)

This project provides a comprehensive Terraform solution for deploying the foundational Azure infrastructure for an LLM-based chatbot specialized in creating, solving, and explaining Infrastructure as Code (IaC) issues.

## Architecture Overview

This solution deploys the following key Azure components:

*   **Resource Group:** A dedicated resource group to contain all chatbot infrastructure.
*   **Azure Key Vault:** Securely stores API keys, connection strings, and other sensitive information, including API keys for external LLMs like Gemini and Claude.
*   **Azure OpenAI Service:** Hosts the Large Language Model (LLM) that powers the chatbot's intelligence, including deployments for models like `gpt-35-turbo` and `gpt-4o`.
*   **Azure Cognitive Search:** Enables Retrieval Augmented Generation (RAG) by indexing IaC documentation, best practices, and error logs.
*   **Azure Storage Account:** Stores data for Cognitive Search and potentially bot state and logs.
*   **Azure Bot Service:** The platform for building and connecting the chatbot.
*   **Azure App Service:** Hosts the chatbot's backend application logic.
*   **Monitoring (Temporarily Disabled):** Placeholder for Log Analytics Workspace for infrastructure monitoring.

## Prerequisites

Before deploying this solution, ensure you have the following:

*   **Azure Subscription:** An active Azure subscription.
*   **Azure CLI:** Installed and configured (`az login`).
*   **Terraform:** Installed ([https://www.terraform.io/downloads.html](https://www.terraform.io/downloads.html)).
*   **Permissions:** Sufficient permissions in your Azure subscription to create resource groups, Azure OpenAI, Cognitive Search, Bot Service, App Service, Key Vault, Storage Accounts, and Log Analytics Workspaces.
*   **Azure OpenAI Access:** Access to Azure OpenAI Service is currently by application only. Ensure your Azure subscription has been approved for Azure OpenAI access. You may also need to request specific model deployments (e.g., `gpt-4`, `gpt-4o`) in your region.
*   **Gemini/Claude API Keys:** Obtain API keys for Google Gemini and Anthropic Claude if you plan to use them. These will be stored securely in Azure Key Vault.

## Deployment Steps

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd iac_gpt_chatbot
    ```

2.  **Review and Customize Variables:**
    Open the `variables.tf` and `terraform.tfvars` files in the root directory. Customize the values as needed for your deployment (e.g., resource names, locations, LLM choice, SKUs, API keys for Gemini/Claude).

3.  **Initialize Terraform:**
    ```bash
    terraform init
    ```

4.  **Review the Plan:**
    ```bash
    terraform plan
    ```

5.  **Apply the Changes:**
    ```bash
    terraform apply
    ```

6.  **Verify Deployment:**
    After the deployment completes, verify the created resources in the Azure portal under the specified resource group.

## Configuration

The `variables.tf` and `terraform.tfvars` files are the primary places to customize your deployment. Key variables include:

*   `resource_group_name`: The name of the Azure Resource Group.
*   `location`: The Azure region for resource deployment.
*   `tags`: Global tags to apply to all resources.
*   `key_vault_name`: Name of the Azure Key Vault.
*   `log_analytics_workspace_name` (Temporarily Commented Out): Name of the Log Analytics Workspace.
*   `openai_name`, `openai_sku`, `openai_model_name`, `openai_model_version`, `openai_model_deployment_name`, `openai_model_capacity`: Azure OpenAI Service configuration.
*   `gpt4o_model_name`, `gpt4o_model_version`, `gpt4o_model_deployment_name`, `gpt4o_model_capacity`: Azure OpenAI Service `gpt-4o` model configuration.
*   `cognitive_search_name`, `cognitive_search_sku`: Azure Cognitive Search configuration.
*   `storage_account_name`: Azure Storage Account for knowledge base.
*   `bot_name`, `app_service_plan_sku`: Azure Bot Service and App Service configuration.
*   `gemini_api_key`, `claude_api_key`: API keys for external LLMs (stored in Key Vault).

## Module Breakdown

*   **`modules/resource_group/`**: Deploys the main Azure Resource Group.
*   **`modules/security/`**: Deploys an Azure Key Vault for secure secret management, including external LLM API keys.
*   **`modules/monitoring/`**: (Temporarily Disabled) Placeholder for Log Analytics Workspace for infrastructure monitoring.
*   **`modules/core_ai_services/`**: Deploys the Azure OpenAI Service and specified LLM deployments (e.g., `gpt-35-turbo`, `gpt-4o`).
*   **`modules/knowledge_base/`**: Deploys Azure Cognitive Search and an Azure Storage Account to serve as a knowledge base for RAG.
*   **`modules/chatbot_infra/`**: Deploys the Azure Bot Service, App Service Plan, and App Service to host the chatbot application.

## Important Notes

*   **Azure OpenAI Access:** Ensure your subscription has the necessary approvals for Azure OpenAI and the specific models you intend to deploy.
*   **Chatbot Application Code:** This Terraform project provisions the Azure infrastructure. You will still need to develop and deploy your actual chatbot application code (e.g., Python, C#, Node.js) to the created App Service. This can be done via Azure DevOps Pipelines, GitHub Actions, Azure CLI (`az webapp deployment`), or other CI/CD tools. The App Service will be configured with environment variables to connect to Azure OpenAI and Key Vault.
*   **RAG Implementation:** The `knowledge_base` module provides the infrastructure for Cognitive Search and Storage. You will need to implement the data ingestion and indexing process for your IaC documentation into Cognitive Search, and integrate this with your chatbot application logic.
*   **Key Vault Secrets:** After deployment, you will need to manually add secrets (e.g., OpenAI API Key) to the Key Vault and configure your App Service to retrieve them using Managed Identity.
*   **External LLM Integration:** The infrastructure is set up to securely store API keys for Gemini and Claude in Key Vault and pass their Secret URIs to the App Service. Your chatbot application code will be responsible for using these keys to interact with the respective LLM APIs.
