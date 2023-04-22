variable "stage" {}

variable "name" {}

variable "license" {}

variable "repo_meissa_token_ro" {}

locals {
  name_with_stage = var.stage == "prod" ? var.name : "test-${var.name}"
}