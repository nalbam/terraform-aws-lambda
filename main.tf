# Lambda Function

resource "aws_s3_bucket_object" "default" {
  bucket = "${var.s3_bucket}"
  key = "${var.s3_key}"
  source = "${var.s3_key}"
}

resource "aws_lambda_function" "default" {
  function_name = "${var.name}-${var.stage}"
  description = "${var.description}"

  s3_bucket = "${var.s3_bucket}"
  s3_key = "${var.s3_key}"

  runtime = "${var.runtime}"
  handler = "${var.handler}"

  memory_size = "${var.memory_size}"
  timeout = "${var.timeout}"

  role = "${aws_iam_role.default.arn}"

  depends_on = [
    "aws_s3_bucket_object.default",
    "aws_iam_role.default",
    "aws_iam_role_policy.default"
  ]

  environment {
    variables = "${var.env_vars}"
  }
}
