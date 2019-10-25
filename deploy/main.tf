resource "aws_dynamodb_table" "hello_world_table" {
  name         = "${local.tags.name}-${terraform.workspace}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "EventId"

  attribute {
    name = "EventId"
    type = "S"
  }
  tags = local.tags
}

resource "aws_s3_bucket" "hello_world_s3_bucket" {
    bucket = "${local.tags.name}-${terraform.workspace}"
    acl    = "private"
    versioning {
        enabled = true
    }
    tags = local.tags
}