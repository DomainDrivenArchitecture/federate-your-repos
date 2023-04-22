terraform {
  required_providers {
    gitea = {
      source  = "Lerentis/gitea"
      version = "0.12.2"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.17"
    }
    gitlab = {
      source = "gitlabhq/gitlab"
      version = "15.8.0"
    }
  }
}