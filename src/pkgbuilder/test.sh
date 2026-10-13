#!/bin/bash
#
# Author: Apostolos Chalis 2026 <achalis@csd.auth.gr>
#

if [ -z "$1" ]; then
    echo "ERROR: No package name given"
    echo "Use: $0 <package-name>"
    echo "Use $0  <branch-name> to check out"
    exit 1
fi

PACKAGE_NAME="$1"
BRANCH_NAME="$2"
REPO="/home/pkgbuilder/$PACKAGE_NAME/"
UNIOS_REPO="/home/pkgbuilder/unios-pkgs/"
PACKAGE_DEST="/home/pkgbuilder/unios-pkgs/packages/x86_64/"

# Fetching new versions
cd $REPO

echo "=== Pulling changes ==="

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/githubKey

git fetch --all
git  pull origin $BRANCH_NAME
git switch $BRANCH_NAME

echo "=== Removing old build files ==="

# TODO: Adjust for C++ projects
rm -rf dist/ pkg/
rm *.zst

echo "=== makepkg -s ==="
makepkg -s
