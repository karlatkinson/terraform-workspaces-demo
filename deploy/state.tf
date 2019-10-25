terraform {
  backend "s3" {
    bucket  = "karl-terraform-state"
    key     = "terraform-workspace-demo/state.tfstate"
    region  = "eu-west-1"
    encrypt = true
    profile = "karlatkinson"
  }
}
