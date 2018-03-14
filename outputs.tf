output "arn" {
  value = "${aws_lambda_function.default.arn}"
}

output "invoke_arn" {
  value = "${aws_lambda_function.default.invoke_arn}"
}
