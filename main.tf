# Lambda Function : sns > lambda > slack

resource "aws_s3_bucket_object" "default" {
  bucket = "${var.bucket}"
  key = "${var.package}"
  source = "${var.package}"
}

resource "aws_lambda_function" "default" {
  function_name = "${var.name}"
  description = "sns > lambda > slack"

  s3_bucket = "${var.bucket}"
  s3_key = "${var.package}"

  runtime = "nodejs6.10"
  handler = "index.handler"

  memory_size = 512
  timeout = 5

  role = "${aws_iam_role.default.arn}"

  depends_on = [
    "aws_iam_role.default"
  ]
}
