variable "codeberg_gitea_token" {}
variable "github_token" {}
variable "gitlab_token" {}

provider "gitea" {
  base_url = "https://codeberg.org"
  token    = var.codeberg_gitea_token
  insecure = false
}

provider "github" {
  token = var.github_token
  owner = "DomainDrivenArchitecture"
}

provider "gitlab" {
  token = var.gitlab_token
}