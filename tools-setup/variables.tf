variable "tools" {
  default = {
    vault = {
        vm_size = "Standard_DS1_v2"
    }
  }
}

variable "rg_name" {
  default = "devops_project_ecom"
}

variable "location" {
  default = "UK West"
}