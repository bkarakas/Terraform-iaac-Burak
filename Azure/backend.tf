terraform {
  backend "azurerm" {
    resource_group_name  = "example1"
    storage_account_name = "example1burak"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    subscription_id  = "75a2be04-05bd-40ca-8aba-89b102a591d2"
    tenant_id        = "39582bc6-811b-4fe2-b695-655280892900"
  }
}
