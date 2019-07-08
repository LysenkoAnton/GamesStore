terraform {
  required_version = ">= 0.11" 
 backend "azurerm" {
  storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
	access_key  ="__storagekey__"
	}
}

resource "random_id" "server" {
  keepers = {
    azi_id = 1
  }

  byte_length = 8
}

resource "azurerm_resource_group" "dev" {
  name     = "aelementterraform"
  location = "West Us"
}

resource "azurerm_app_service_plan" "dev" {
  name                = "__appserviceplan__"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "dev" {
  name                = "__appservicename__"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"
}

resource "azurerm_app_service_slot" "dev" {
  name                = "Stage"
  app_service_name    = "${azurerm_app_service.dev.name}"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"

}

resource "azurerm_sql_server" "dev" {
  name                         = "gamestore-server"
  resource_group_name          = "${azurerm_resource_group.dev.name}"
  location                     = "${azurerm_resource_group.dev.location}"
  version                      = "12.0"
  administrator_login          = "dbadmin"
  administrator_login_password = "$(Password)"
}

resource "azurerm_sql_database" "dev" {
  name                = "gamestore"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  location            = "${azurerm_resource_group.dev.location}"
  server_name         = "${azurerm_sql_server.dev.name}"
  edition             = "Basic"
}

resource "azurerm_sql_firewall_rule" "dev" {
  name                = "FirewallRule1"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  server_name         = "${azurerm_sql_server.dev.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
