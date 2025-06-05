provider "azurerm" {
  features {}
  subscription_id = "4a491ea7-cd6d-4ec6-aa18-28b31973e70c"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstoragestate"
  resource_group_name      = "devops_project_ecom"
  location                 = "UK West"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfcontainer" {
  name                  = "roboshop-tfstate-file"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}