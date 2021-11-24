terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 3.65"
      configuration_aliases = [aws.this, aws.peer]
    }
  }
}