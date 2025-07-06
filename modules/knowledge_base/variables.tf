variable "resource_group_name" {
  description = "The name of the resource group for the knowledge base components."
  type        = string
}

variable "location" {
  description = "The Azure region for the knowledge base components."
  type        = string
}

variable "cognitive_search_name" {
  description = "The name of the Azure Cognitive Search service."
  type        = string
}

variable "cognitive_search_sku" {
  description = "The SKU for Azure Cognitive Search (e.g., basic, standard, standard2)."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure Storage Account for knowledge base."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources."
  type        = map(string)
  default     = {}
}
