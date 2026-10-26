#!/bin/bash
#
# Author: Apostolos Chalis 2026 <achalis@csd.auth.gr>
#

REPO="/home/isobuilder/unios-iso"

cd $REPO
echo "=== Pulling Changes ==="
git pull origin main

echo "=== Starting to build ISO ===" 
mkarchiso -v -w -r ./work -o ./out ./unios-iso/archlive
