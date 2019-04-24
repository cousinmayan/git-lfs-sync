workflow "Test Git LFS Sync" {
  on = "push"
  resolves = [
    "actions/download-lfs",
  ]
}

action "actions/download-lfs" {
  uses = "./.github/actions/download-lfs"
  secrets = ["GITHUB_TOKEN"]
}
