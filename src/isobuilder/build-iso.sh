!/bin/bash
#
# Author: Apostolos Chalis 2026 <achalis@csd.auth.gr>
#

echo "=== WARNING ===" 
echo "The produced ISO file will be available to the public" 
echo "If you are just testing or messing around abort in the next five seconds" 
echo "5s couting now..." 
sleep 1
echo "4s.." 
sleep 1 
echo "3s.." 
sleep 1 
echo "2s.." 
sleep 1 
echo "1s.." 
sleep 1
echo "Intiating ISO building" 

REPO="/home/isobuilder/unios-iso"

cd $REPO
echo "=== Pulling Changes ==="
git pull origin main

echo "=== Starting to build ISO ==="
sudo mkarchiso -v -w "$REPO/work" -o "$REPO/out" "$REPO/archlive"

