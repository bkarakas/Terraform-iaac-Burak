terraform {
  backend "azurerm" {
    resource_group_name  = "example1"
    storage_account_name = "example1burak"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    access_key           = "SC8cPM8Rf93KXhIBcy3WOZwv9qDTiR6qq5fEb7r2Z2tr127EFvjaxdoe2ca9JNq7vB+7uijSOJzkBbNb0+KbGg==" 
  }
}

