workflow "Test Git LFS Sync" {
  on = "push"
  resolves = [
    "Git LFS Sync",
  ]
}

action "Git LFS Sync" {
  uses = "./"
  secrets = ["GITHUB_TOKEN"]
}
