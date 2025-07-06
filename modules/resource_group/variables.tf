variable "name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region for the resource group."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource group."
  type        = map(string)
  default     = {}
}
