terraform {
  backend "azurerm" {
    resource_group_name  = "example1"
    storage_account_name = "example1burak"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
