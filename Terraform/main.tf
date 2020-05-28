provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name      = "__resource_group_name__"
  location  = "__location__"
}

resource "azurerm_app_service_plan" "main" {
  name                = "__service_plan_name__"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "__app_service_name__"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"
  
  site_config {
    dotnet_core_version = "v3.1"
  }
}
