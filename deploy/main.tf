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

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "${local.instance_type}"

  tags = local.tags
}