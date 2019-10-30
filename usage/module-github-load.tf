module "vpc" {
  source = "git::${var.git_repo}?ref=${var.branch}"
}