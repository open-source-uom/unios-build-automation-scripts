#!/bin/bash
#
# Author: Apostolos Chalis 2026 <achalis@csd.auth.gr>
#

REPO="/home/isobuilder/unios-iso"

cd $REPO
echo "=== Pulling Changes ==="
git pull origin main

 
echo "=== Cleaning up old files ===" 
rm -rf work/ out/ 

echo "=== Starting to build ISO ===" 
mkarchiso -v -w ./work -o ./out ./unios-iso/archlive
