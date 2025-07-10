variable "tools" {
  default = {
    vault = {
        vm_size = "Standard_D2ls_v5"
    }
    github-runner = {
        vm_size = "Standard_D2ls_v5"
    }
  }
}

variable "rg_name" {
  default = "devops_project_ecom"
}

variable "location" {
  default = "UK West"
}