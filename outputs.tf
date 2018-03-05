output "lambda_function_arn" {
  value = "${aws_lambda_function.default.arn}"
}

output "lambda_function_invoke_arn" {
  value = "${aws_lambda_function.default.invoke_arn}"
}
