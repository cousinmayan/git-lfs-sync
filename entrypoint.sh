#!/bin/sh -l

set -eu

echo "Try setting credential helper cache..."
git config --global credential.helper cache

# Authenticate Git LFS to avoid rate limiting
echo "Adding github login token to netrc..."
echo "machine github.com login ${GITHUB_TOKEN}" > ${HOME}/.netrc

echo "Using Git config to set LFS access to basic..."
git config lfs.https://github.com/${GITHUB_REPOSITORY}.git/info/lfs.access basic

echo "Git LFS sees these files..."
git lfs ls-files

echo "Git LFS pull..."
git lfs pull

echo "Git LFS pull finished."
