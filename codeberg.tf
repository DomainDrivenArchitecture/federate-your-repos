data "gitea_org" "dda" { 
  name = "DomainDrivenArchitecture" 
}

resource "gitea_repository" "repo" {
  username                     = data.gitea_org.dda.name
  name                         = local.name_with_stage
  private                      = false
  auto_init                    = false
  license                      = var.license
  has_issues                   = true
  has_projects                 = false
  has_pull_requests            = true
  migration_issue_labels       = false
  migration_milestones         = false
  migration_releases           = false
  mirror                       = true  
  migration_clone_address      = "https://repo.prod.meissa.de/meissa/c4k-gitea.git"
  migration_service            = "gitea"
  migration_service_auth_token = var.repo_meissa_token_ro
}
