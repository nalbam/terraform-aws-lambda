# Lambda Function

resource "aws_s3_bucket_object" "default" {
  bucket = "${var.bucket}"
  key = "${var.package}"
  source = "${var.package}"
}

resource "aws_lambda_function" "default" {
  function_name = "${var.name}-${var.stage}"
  description = "${var.description}"

  s3_bucket = "${var.bucket}"
  s3_key = "${var.package}"

  runtime = "${var.runtime}"
  handler = "${var.handler}"

  memory_size = "${var.memory_size}"
  timeout = "${var.timeout}"

  role = "${aws_iam_role.default.arn}"

  depends_on = [
    "aws_s3_bucket_object.default",
    "aws_iam_role.default"
  ]

  environment {
    variables = "${var.variables}"
  }
}
