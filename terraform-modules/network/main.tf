resource "azurerm_resource_group" "rg1" {
  name     =  var.rg-name
  location = var.location
}

resource "azurerm_virtual_network" "v-net" {
  name                = var.vnet_Name
  address_space       = [var.vnet_Address]
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
}

resource "azurerm_subnet" "subnet" {
  count =  length(var.subnet_NameList)
  name                 = var.subnet_NameList[count.index]
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.v-net.name
  address_prefixes     = [var.subnet_AddressList[count.index]]
}