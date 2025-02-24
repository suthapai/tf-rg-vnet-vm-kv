subscription_id = "2f988b10-9ba2-4c26-8472-c863d0ff88e4"
## Pre Defined KV for storing secret
devKV_Name         = "iac-test12"       #### We have to change as per env
kv-rg-name         = "Blog_RG"
## VNET - SUBNET
rg-name            = "Demo-Test" ## We have to change as per env
location           = "eastus"
vnet_Name          = "vnet-terraform-modulesdev-eus2"
vnet_Address       = "178.29.192.0/20"
subnet_NameList    = ["snet-aks-terraform-modulesdev-eus2", "snet-agw-terraform-modulesdev-eus2", "snet-shared-terraform-modulesdev-eus2", "snet-vm-terraform-modulesdev-eus2", "GatewaySubnet"]
subnet_AddressList = ["178.29.192.0/26", "178.29.192.64/26", "178.29.192.128/26", "178.29.192.192/26", "178.29.193.0/26"]



### Linux Virtual Machine Deployment

virtual_machine_Usr    = "virtual-machine-user"
virtual_machine_Passwd = "virtual-machine-password"

nic                    = "win_vm_nic"
ip_configuration       = "ip_config"
vm-name                = "win-terra-vm"
size                   = "Standard_B2s"
vm_username            = "" ## Fetched from KV.
vm_password            = "" ## Fetched from KV.
vm_image_publisher     = "Canonical"
vm_image_offer         = "ubuntu-24_04-lts"
vm_image_sku           = "server"
vm_image_version       = "latest"
vm_os_disk_strg_type   = "Standard_LRS"
vm_os_disk_caching     = "ReadWrite"
