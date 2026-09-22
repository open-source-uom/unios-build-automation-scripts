#
# Author: Apostolos Chalis 2025 <achalis@csd.auth.gr> 
#
#!/bin/bash

if [ -z "$1" ]; then
    echo "ERROR: No package name given"
    echo "Use: $0 <package-name>"
    exit 1
fi

PACKAGE_NAME="$1"
REPO="../../$PACKAGE_NAME/" 
UNIOS_REPO="../unios-pkgs/"
PACKAGE_DEST="../unios-pkgs/packages/x86_64/"

# Fetching new versions
cd $REPO

echo "=== Pulling changes ==" 
git pull origin main

echo "=== Removing old build files ===" 

# TODO: Adjust for C++ projects
rm -rf dist/ pkg/
rm *.zst

echo "=== makepkg -s ==="
makepkg -s 

echo "=== Moving binary to unios-pkgs for upload ==="
mv *zst $PACKAGE_DEST

echo "=== Updating repo ===" 
cd $UNIOS_REPO 
./update_repo_server.sh
