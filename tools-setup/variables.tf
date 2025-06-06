variable "tools" {
  default = {
    vault = {
        vm_size = "Standard_B1ms"
    }
  }
}

variable "rg_name" {
  default = "devops_project_ecom"
}

variable "location" {
  default = "UK West"
}