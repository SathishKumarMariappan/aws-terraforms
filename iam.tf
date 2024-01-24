data "aws_iam_policy_document" "assume_role" {
    statement {
      effect = "Allow"

      principals {
        type = "Service"
        identifiers = [ "lambda.amazonaws.com" ]
      }

      actions = [ "sts:AssumeRole" ]

    }
}

data "aws_iam_policy_document" "dynamodb_policy" {
    statement {
      effect = "Allow"
      actions = [ "dynamodb:scan" ]
      resources = [ "arn:aws:dynamodb:ap-south-1:357757169789:table/GameScores" ]

    }
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "labmda_dynamodb_policy" {
  name = "labmda_dynamodb_policy"
  role = aws_iam_role.iam_for_lambda.name
  policy = data.aws_iam_policy_document.dynamodb_policy.json
}

# resource "aws_iam_policy_attachment" "lambda_basic_excecution" {
#     role = aws_iam_role.iam_for_lambda.name
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
# }


# resource "aws_iam_policy_attachment" "lambda_role" {
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
#   role = aws_iam_role.iam_for_lambda.name
# }



