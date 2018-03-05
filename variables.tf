data "aws_caller_identity" "current" {}

variable region {
  default = "ap-northeast-2"
}

variable name {
  default = "demo"
}

variable description {
  default = ""
}

variable "bucket" {
  //default = ""
  description = ""
}

variable "package" {
  //default = ""
  description = ""
}
