#!bin/bash

cd /tmp

# Creating TOR Exit-Node List
wget https://check.torproject.org/exit-addresses
cat exit-addresses | grep -i exitaddress | cut -d' ' -f2 > /tmp/tor-nodes
rm -rf exit-addresses


# Creating Brute Force Blocker List
wget http://danger.rulez.sk/projects/bruteforceblocker/blist.php
sed -i '1d' blist.php
awk '{print $1 "," $3 " " $4}' blist.php > /tmp/bruteforceblocker
rm -rf blist.php


# Creating darklist.de List
wget http://www.darklist.de/raw.php
sed -i '1,3d' raw.php
cat /tmp/raw.php | grep -v / > /tmp/darklistip
cat /tmp/raw.php | grep / > /tmp/darklistnet
rm -rf raw.php


# Creating PhishTank URL List
wget http://data.phishtank.com/data/online-valid.csv
sed -i '1d' online-valid.csv
cut -d',' -f2,3,4,8 online-valid.csv > /tmp/phishtank
rm -rf online-valid.csv

exit