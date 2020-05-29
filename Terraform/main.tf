provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "main" {
  name                = "__service_plan_name__"
  location            = "__location__"
  resource_group_name = "__resource_group_name__"
  
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "__app_service_name__"
  location            = "__location__"
  resource_group_name = "__location__"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"
}
