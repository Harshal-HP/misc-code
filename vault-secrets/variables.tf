variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "Roboshop app components all secrets"
    }
  }
}

variable "values" {
  default = {
    ssh = {
      secret = "roboshop-dev"
      values = {
        username = "harshal"
        password = "harshal@12345"
      }
    }
  }
}