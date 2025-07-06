variable "resource_group_name" {
  description = "The name of the resource group for the Log Analytics Workspace."
  type        = string
}

variable "location" {
  description = "The Azure region for the Log Analytics Workspace."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the Log Analytics Workspace."
  type        = map(string)
  default     = {}
}
