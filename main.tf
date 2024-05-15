terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "TOKEN" # or `GITHUB_TOKEN`
}

resource "github_repository" "terraform-lab" {
  name        = "terraform-lab"
  description = "My awesome codebase for terraform lab"

  visibility = "public"
  auto_init  = true
}

resource "github_branch" "development" {
  repository = "terraform-lab"
  branch     = "development"
  depends_on = [
    github_repository.terraform-lab
  ]
}

resource "github_branch" "stagging" {
  repository = "terraform-lab"
  branch     = "stagging"
  depends_on = [
    github_repository.terraform-lab
  ]
}

resource "github_branch" "publish" {
  repository = "terraform-lab"
  branch     = "publish"
  depends_on = [
    github_repository.terraform-lab
  ]
}