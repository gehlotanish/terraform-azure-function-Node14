provider azurerm {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = var.azurerm_resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.storage_account_container
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

resource "azurerm_app_service_plan" "example" {
  name                = var.azurerm_app_service_plan_name
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  kind                = "linux"
  reserved            = true
  sku {
    tier = "Basic"
    size = "B1"
  }
}


resource "azurerm_function_app" "example" {
  name                       = var.azurerm_function_app_name
  location                   = azurerm_resource_group.example.location
  resource_group_name        = azurerm_resource_group.example.name
  app_service_plan_id        = azurerm_app_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  os_type                    = "linux"
  version                    = "~3"
  site_config {
    linux_fx_version          = "NODE|14-lts"
    use_32_bit_worker_process = "false"
  }
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"    = "node"
    "FUNCTIONS_EXTENSION_VERSION" = "~3"
  }

}
