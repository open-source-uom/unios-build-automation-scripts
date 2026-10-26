!/bin/bash
#
# Author: Apostolos Chalis 2026 <achalis@csd.auth.gr>
#

REPO="/home/isobuilder/unios-iso"

cd $REPO
echo "=== Pulling Changes ==="
git pull origin main

echo "=== Starting to build ISO ==="
sudo mkarchiso -v -w "$REPO/work" -o "$REPO/out" "$REPO/archlive"

echo "=== Your ISO is ready to test ==="
echo "Note: The newly created ISO has not been deployed publicly" 
