terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.18.0"
    }
  }
  backend "azurerm" {

     resource_group_name  = "rg-tfstate"                # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
     storage_account_name = "sgtfstatefile"                # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
     container_name       = "mytfstate"                   # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
     key                  = "terraform.tfstate"
    
    
  }
}
provider "azurerm" {

  features {}
  #client_id       = "your client id"
  #client_secret   = var.client_secret
  #tenant_id       = "your tenant id"
  #subscription_id = "your subscription id"

  subscription_id   = var.subscription_id
  
}
### Data source for KV - to retrive the secrets from KV, declaring the existing KV details.
data "azurerm_key_vault" "kv_name" {
  name                = var.devKV_Name
  resource_group_name = var.kv-rg-name 
}
## To get object & tenant ID , declaring the data source. 
data "azurerm_client_config" "current" {}





############# 1. VNET & SUBNET Deployment Code #############

module "vnet01" {
  source             = "../terraform-modules/network"
  vnet_Name          = var.vnet_Name
  rg-name            = var.rg-name
  location           = var.location
  vnet_Address       = var.vnet_Address
  subnet_NameList    = var.subnet_NameList
  subnet_AddressList = var.subnet_AddressList
}

##virtual machine deployment
data "azurerm_key_vault_secret" "vm_user" {
  name         = var.virtual_machine_Usr
  key_vault_id = data.azurerm_key_vault.kv_name.id
  
}
data "azurerm_key_vault_secret" "vm_password" {
  name = var.virtual_machine_Passwd
  key_vault_id = data.azurerm_key_vault.kv_name.id
} 

module "linux_vm" {
  depends_on           = [module.vnet01.subnet]
  source               = "../terraform-modules/vm"
  
  rg-name              = var.rg-name
  location             = var.location
  nic                  = var.nic
  ip_configuration     = var.ip_configuration
  vm-name              = var.vm-name
  size                 = var.size
  username             = data.azurerm_key_vault_secret.vm_user.value
  password             = data.azurerm_key_vault_secret.vm_password.value
  vm_image_publisher   = var.vm_image_publisher
  vm_image_offer       = var.vm_image_offer
  vm_image_sku         = var.vm_image_sku
  vm_image_version     = var.vm_image_version
  vm_os_disk_strg_type = var.vm_os_disk_strg_type
  vm_os_disk_caching   = var.vm_os_disk_caching
  subnet-id            = module.vnet01.subnet_Id[3]
}
