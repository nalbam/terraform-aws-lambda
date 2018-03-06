# terraform-aws-lambda

## usage
```
module "lambda" {
  source = "git::https://gitlab.com/nalbam/terraform-aws-lambda.git"
  region = "ap-northeast-2"

  name = "demo"
  stage = "dev"
  runtime = "nodejs6.10"
  handler = "index.handler"
  memory_size = 512
  timeout = 5
  bucket = "bucket_name"
  package = "data/demo.zip"
}
```
