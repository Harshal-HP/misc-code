variable "token" {}

variable "secrets" {
  default = {
    roboshop-infra = {
      description = "Roboshop app components all secrets"
    }
  }
}

variable "values" {
  default = {
    ssh = {
      secret = "roboshop-infra"
      values = {
        username = "harshal"
        password = "harshal@12345"
      }
    }
  }
}