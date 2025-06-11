variable "token" {}

variable "secrets" {
  default = {
    roboshop-infra = {
      description = "Roboshop app components all secrets"
    }
    roboshop-dev = {
      description = "Roboshop app component all secrets"
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
    frontend = {
      secret = "roboshop-dev"
      values = {
        catalogue-url  = "http://catalogue-dev.harshaldevops.online:8080/"
        user-url       = "http://user-dev.harshaldevops.online:8080/"
        cart-url       = "http://cart-dev.harshaldevops.online:8080/"
        shipping-url   = "http://shipping-dev.harshaldevops.online:8080/"
        payment-url    = "http://payment-dev.harshaldevops.online:8080/"
        CATALOGUE_HOST = "catalogue-ip"
      }
    }
    cart = {
      secret = "roboshop-dev"
      values = {
        REDIS_HOST = "redis-dev.harshaldevops.online"
        CATALOGUE_HOST = "catalogue-dev.harshaldevops.online"
        CATALOGUE_PORT = 8080
      }
    }
    catalogue = {
      secret = "roboshop-dev"
      values = {
        MONGO       = "true"
        MONGO_URL   = "mongodb://mongodb-dev.harshaldevops.online:27017/catalogue"
        DB_TYPE     = "mongo"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
        DB_HOST     = "mongo-ip"
      }
    }
    dispatch = {
      secret = "roboshop-dev"
      values = {
        AMQP_HOST = "rabbitmq-dev.harshaldevops.online"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
     }
    }
    payment = {
      secret = "roboshop-dev"
      values = {
        CART_HOST = "cart-dev.harshaldevops.online"
        CART_PORT = 8080
        USER_HOST = "user-dev.harshaldevops.online"
        USER_PORT = 8080
        AMQP_HOST = "rabbitmq-dev.harshaldevops.online"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
    }
    shipping = {
      secret = "roboshop-dev"
      values = {
        CART_ENDPOINT = "cart-dev.harshaldevops.online:8080"
        DB_HOST       = "mysql-dev.harshaldevops.online"
        username      = "root"
        password      = "RoboShop@1"
        DB_TYPE       = "mysql"
        APP_GIT_URL   = "https://github.com/roboshop-devops-project-v3/shipping"
        DB_USER       = "root"
      }
    }
    user = {
      secret = "roboshop-dev"
      values = {
        MONGO     = "true"
        REDIS_URL = "redis://redis-dev.harshaldevops.online:6379"
        MONGO_URL = "mongodb://mongodb-dev.harshaldevops.online:27017/users"
      }
    }
    rabbitmq = {
      secret = "roboshop-dev"
      values = {
        username = "roboshop"
        password = "roboshop123"
      }
    }
    mysql = {
      secret = "roboshop-dev"
      values = {
        password = "RoboShop@1"
      }
    }
  }
}