data "gitlab_group" "dda" {
  full_path = "DomainDrivenArchitecture"
}

resource "gitlab_project" "repo" {
  name = local.name_with_stage

  visibility_level           = "public"
  initialize_with_readme     = false
  issues_enabled             = false
  wiki_enabled               = false
  auto_devops_enabled        = false
  packages_enabled           = false
  request_access_enabled     = false
  snippets_enabled           = false
  #mirror                     = true
  container_expiration_policy {
    enabled = false
  }
  push_rules {
    deny_delete_tag = true
  }
}
/*
resource "gitlab_project_mirror" "mirror_gitea" {
  project = "3"
  url = "https://repo.prod.meissa.de/api/v1/repositories/3?token=${var.gitea_api_token}"
}
*/
