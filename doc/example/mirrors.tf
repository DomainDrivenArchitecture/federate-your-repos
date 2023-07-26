variable "codeberg_gitea_token" {}
variable "github_token" {}
variable "gitlab_token" {}
variable "repo_meissa_token_ro" {}

module "dda-python-terraform" {
  source               = "git::https://repo.prod.meissa.de/meissa/federate-your-repos.git"
  stage                = var.stage
  codeberg_gitea_token = var.codeberg_gitea_token
  github_token         = var.github_token
  gitlab_token         = var.gitlab_token
  repo_meissa_token_ro = var.repo_meissa_token_ro
  name                 = "dda-python-terraform"
  license              = "Mit"
}

module "dda-devops-build" {
  source               = "git::https://repo.prod.meissa.de/meissa/federate-your-repos.git"
  stage                = var.stage
  codeberg_gitea_token = var.codeberg_gitea_token
  github_token         = var.github_token
  gitlab_token         = var.gitlab_token
  repo_meissa_token_ro = var.repo_meissa_token_ro
  name                 = "dda-devops-build"
  license              = "Mit"
}

module "c4k-forgejo" {
  source               = "git::https://repo.prod.meissa.de/meissa/federate-your-repos.git"
  stage                = var.stage
  codeberg_gitea_token = var.codeberg_gitea_token
  github_token         = var.github_token
  gitlab_token         = var.gitlab_token
  repo_meissa_token_ro = var.repo_meissa_token_ro
  name                 = "dda-devops-build"
  license              = "Mit"
}
