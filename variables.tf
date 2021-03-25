variable azurerm_resource_group_name {
  type        = string
  description = "Azure Resource Group Name"
}

variable location {
  type        = string
  description = "Azure Region location"
}

variable environment {
  type        = string
  description = "Resource Tags ENVIRONMENT Value"
}

variable storage_name {
  type        = string
  description = "Azure Storage Name must be unique and contains only alphanumeric value"
}

variable storage_account_container {
  type        = string
  description = "Azure Storage Blob Private Container Name"
}

variable azurerm_app_service_plan_name {
  type        = string
  description = "Specifies the name of the App Service Plan component. Changing this forces a new resource to be created."
}

variable azurerm_function_app_name {
  type        = string
  description = "Specifies the name of the Function App. Changing this forces a new resource to be created."
}

