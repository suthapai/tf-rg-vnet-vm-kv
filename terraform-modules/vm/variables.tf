variable "nic" {
    type = string
    default = ""
    description = "Network interface card value"
}
variable "rg-name" {
  type        = string
  default     = ""
  description = "Resource Group to be used for Virtual Machine Deployment"
}
variable "location" {
  type        = string
  default     = ""
  description = "Location of the Azure Virtual Machine"
}
variable "ip_configuration" {
  type        = string
  default     = ""
  description = "IP configuration name for Azure Virtual Machine"
}
variable "subnet-id" {
  type        = string
  default     = ""
  description = "Subnet-id for the Azure Virtual Machine"
}
variable "vm-name" {
  type        = string
  default     = ""
  description =  "Name of the Virtual Machine to be created."
}
variable "size" {
  type        = string
  default     = ""
  description = "Virtual Machine \"Size\"SKU\" to be created such as : Standard_F2"
}
variable "username" {
  type        = string
  default     = ""
  description = "Username for Azure Virtual Machine"
}
variable "password" {
  type        = string
  default     = ""
  description = "Password for Azure Virtual Machine"
}

variable "vm_image_publisher" {
  type        = string
  default     = ""
  description = "Azure Virtual Machine Publisher such as :Canonical."
}
variable "vm_image_offer" {
  type        = string
  default     = ""
  description = "Image Offer for the Publisher selected. Available options can be : 0001-com-ubuntu-server-jammy."
}
variable "vm_image_sku" {
  type        = string
  default     = ""
  description = "Image Version or SKU for the publisher you have chosen. Such as 22_04-lts."
}
variable "vm_image_version" {
  type        = string
  default     = ""
  description = "This is the Image Version of the SKU that you have selected. Usually the selected option is \"Latest\". "
}
variable "vm_os_disk_strg_type" {
  type        = string
  default     = "Standard_LRS"
  description = "OS Disk Storage Type. Possible options are Standard_LRS, StandardSSD_LRS and Premium_LRS."
  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS"], var.vm_os_disk_strg_type)
    error_message = "Unsupported disk type for Virtual machine. Possible options are Standard_LRS, StandardSSD_LRS and Premium_LRS."
  }
}

variable "vm_os_disk_caching" {
  type        = string
  default     = "ReadWrite"
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.vm_os_disk_caching)
    error_message = "Unsupported value for disk caching. Possible values are None, ReadOnly and ReadWrite."
  }
}