# terraform-aws-lambda

## usage
```
module "lambda" {
  source = "git::https://gitlab.com/nalbam/terraform-aws-lambda.git"
  region = "ap-northeast-2"

  name = "demo"
  bucket = "terraform-demo-seoul-dev"
  package = "data/demo.zip"
}
```
