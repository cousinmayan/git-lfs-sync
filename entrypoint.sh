#!/bin/sh -l

set -eu

# Authenticate Git LFS to avoid rate limiting
echo "machine github.com
        login ${GITHUB_TOKEN}" > ${HOME}/.netrc
git config lfs.https://github.com/${GITHUB_REPOSITORY}.git/info/lfs.access basic

echo "Git LFS sees these files..."
git lfs ls-files

echo "Git LFS fetch..."
git lfs fetch --all

echo "Git LFS checkout..."
git lfs checkout

echo "Git LFS finished."
