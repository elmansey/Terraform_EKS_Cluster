terraform {
  backend "s3" {
    dynamodb_table = "locking_state"
    bucket = "remotebackendstatefile"
    key     = "terraform.tfstate"
    region  = "us-east-1"
  }
}