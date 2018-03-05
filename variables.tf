data "aws_caller_identity" "current" {}

variable region {
  default = "ap-northeast-2"
}

variable name {
  default = "demo"
}

variable stage {
  default = "dev"
}

variable description {
  default = ""
}

variable "runtime" {
  //default = ""
  description = ""
}

variable "handler" {
  //default = ""
  description = ""
}

variable "memory_size" {
  default = "512"
  description = ""
}

variable "timeout" {
  default = "5"
  description = ""
}

variable "bucket" {
  //default = ""
  description = ""
}

variable "package" {
  //default = ""
  description = ""
}

variable "variables" {
  type = "map"
  default = {}
  description = ""
}
