# terraform {
#   backend "azurerm" {
#   }
# }

provider "azurerm" {
  version = ">=3.10.0"
  # The "feature" block is required for AzureRM provider 2.x.
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "av-test-rg"
  location = "westeurope"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.80.96.0/20"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.80.96.0/26"
  }
  subnet {
    name           = "subnet2"
    address_prefix = "10.80.96.128/27"
  }
  subnet {
    name           = "subnet3"
    address_prefix = "10.80.96.96/27"
  }
  subnet {
    name           = "subnet4"
    address_prefix = "10.80.96.160/27"
  }
  subnet {
    name           = "subnet5"
    address_prefix = "10.80.96.192/27"
  }
}