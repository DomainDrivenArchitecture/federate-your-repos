data "github_organization" "dda" {
  name = "DomainDrivenArchitecture"
}

resource "github_repository" "repo" {
  name = local.name_with_stage

  visibility         = "public"
  auto_init          = false
  has_issues         = false
  has_projects       = false
  has_downloads      = false
  has_wiki           = false
  has_discussions    = false
  archive_on_destroy = false
}
 