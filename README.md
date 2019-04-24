# GitHub Action to Fetch/Checkout Git LFS Files

If your repo uses Git LFS and you need to download all large files to your workspace in order to interact with them, this will do it.


## Disclaimer

There may be a better, more obvious way to acheive this goal, but this works for me.


## Required Secret

This action requires one secret:

- `GITHUB_TOKEN`

You can assign this value thru the Github UI. It is used to authenticate the Git LFS downloads.


## Environment Variables

This action uses two env variables that should already be set by default.

- `HOME`
- `GITHUB_REPOSITORY`


## Example Usage

```
action "Git LFS Sync" {
  uses = "cousinmayan/git-lfs-sync@v0.1.2"
  secrets = ["GITHUB_TOKEN"]
}
```
