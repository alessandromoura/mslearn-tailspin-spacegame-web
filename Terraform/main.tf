provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name      = "${var.resource_group_name}"
  location  = "${var.location}"
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.service_plan_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.app_service_name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"
  
  site_config {
    dotnet_core_version = "v3.1"
  }
}
