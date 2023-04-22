# federate-your-repos

Support mirroring your federated repositories to common plattforms in order to get found.

## Rational

It is always the same - it's about regaining digital sovereignty.

With OpenSource, the story is absolutely comparable to the situation on Twitter, Facebook or Youtube. You have invested countless hours to realize your idea and building a community. The big platforms profit from this.

We advocate that the fruits of our investment end up with us and not with Microsoft, Facbook, Twitter or Gitlab.

So we will not longer propagate Links to Github, Gitlab or any other foreign platform. In al fully federated world that will be the idea.

But in the time beeing we will not livbe in this perfect world. So we present our model to handle this intermediate time. There are some principles:

1. Any marketing invest (links in blogs, mblogs, toots, ...) will link to our own repository.
2. In order to enable interaction with our community we accept issues & PR on the most relevant and the least unappealing platform.
3. We interact primarily with the platform our CI is running on.
4. We mirror our repository to the remaining bunch of platforms in order to get found if someone is searching for our OpenSource solution.
5. Every repository has an section where we accept Issues & PRs and where mirrors exist.

## Realisation

# Mirroring

At the moment our CI is running on gitlab, so thats our current model

```mermaid
C4Context
    Person(community, "Community")
    Person(maint, "Maintainer")

    System_Boundary(gitlab, "GitLab") {
        System(gitlab-repo, "GitLab")
        System(gitlab-ci, "GitLab-CI")
    }
    System_Boundary(codeberg, "Codeberg") {
        System(cb-repo, "Codeberg")
    }
    System_Boundary(gitea, "repo.prod.meissa.de") {
        System(gitea-repo, "repo")
    }
    System_Boundary(github, "github") {
        System(github-repo, "GitHub")
    }

    Rel(maint, gitlab-repo, "interact")
    Rel(community, gitlab-repo, "interact")

    Rel(gitlab-repo, gitea-repo, "mirror on pull")
    Rel(gitea-repo, github-repo, "mirror on push")
    Rel(gitea-repo, cb-repo, "mirror on push")

    UpdateLayoutConfig($c4ShapeInRow="3", $c4BoundaryInRow="2")
```

## Artefacts & CI

```mermaid
C4Context
    System_Boundary(gitlab, "GitLab") {
        System(gitlab-repo, "GitLab")
        System(gitlab-ci, "GitLab-CI")
    }
    System_Boundary(gitea, "repo.prod.meissa.de") {
        System(gitea-repo, "repo")
        System(gitea-release-pages, "release pages")
        System(gitea-artifacts, "artifacts")
    }
    System_Boundary(art, "Artifact Repositories") {
        System(pypi, "Pypi")
        System(docker, "Docker Hub")
        System(npm, "Npm")
        System(clojars, "Clojars")
    }   

    Rel(gitlab-ci, gitea-release-pages, "create release & upload changelog")
    Rel(gitlab-ci, gitea-artifacts, "artifact upload")
    Rel(gitlab-ci, clojars, "artifact upload")
    Rel(gitlab-ci, pypi, "artifact upload")
    Rel(gitlab-ci, npm, "artifact upload")
    Rel(gitlab-ci, docker, "artifact upload")

    UpdateLayoutConfig($c4ShapeInRow="3", $c4BoundaryInRow="2")
```