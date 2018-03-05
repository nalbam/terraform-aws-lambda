# IAM for lambda

# https://docs.aws.amazon.com/ko_kr/lambda/latest/dg/policy-templates.html

data "aws_iam_policy_document" "lambda-role" {
  statement {
    sid = ""
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
    effect = "Allow"
  }
}

data "aws_iam_policy_document" "lambda-policy" {
  statement {
    sid = ""
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "arn:aws:logs:*"
    ]
    effect = "Allow"
  }
  statement {
    sid = ""
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "arn:aws:s3:::*"
    ]
    effect = "Allow"
  }
  statement {
    sid = ""
    actions = [
      "dynamodb:DeleteItem",
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:Scan",
      "dynamodb:UpdateItem"
    ]
    resources = [
      "arn:aws:dynamodb:*"
    ]
    effect = "Allow"
  }
}

resource "aws_iam_role" "default" {
  name = "${var.name}-lambda-role-${var.region}"
  assume_role_policy = "${data.aws_iam_policy_document.lambda-role.json}"
}

resource "aws_iam_role_policy" "default" {
  name = "${var.name}-lambda-policy-${var.region}"
  role = "${aws_iam_role.default.id}"
  policy = "${data.aws_iam_policy_document.lambda-policy.json}"
}
