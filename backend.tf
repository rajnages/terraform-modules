terraform {
  backend "s3" {
    bucket         = "my-terraform-state-file-prod"
    region         = "us-east-1"
    key            = "terraform.tfstate"
    # dynamodb_table = "terraform-lock-table"
    # encrypt        = true
  }
}
