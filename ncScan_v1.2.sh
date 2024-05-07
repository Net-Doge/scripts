#!/bin/bash
echo "         ▄              ▄"
echo "        ▌▒█           ▄▀▒▌"
echo "        ▌▒▒█        ▄▀▒▒▒▐"
echo "       ▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐"
echo "     ▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐"
echo "   ▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌"
echo "  ▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌"
echo "  ▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐"
echo " ▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌"
echo "▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌"
echo "▌▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐"
echo "▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌"
echo "▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐"
echo " ▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌"
echo " ▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐"
echo "  ▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌"
echo "    ▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀"
echo "      ▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀"
echo "         ▒▒▒▒▒▒▒▒▒▒▀▀"

echo "Enter the first 3 octets of the network you want to scan: "
read net
echo "Scanning $net network, enter last octet start: "
read nStart
echo "Enter last octet end: "
read nEnd

echo "scanning $net.$nStart - $nEnd"
pStart="1"
pEnd="1000"

#for NUMBER in RANGE 

for ((x=$nStart; $x<=$nEnd; x++))
do
    echo "Scanning $net.$x"
    for ((i=$pStart; $i<=$pEnd; i++))
    do
        timeout 0.01 nc -nvz $net.$x $i 2>&1 | grep -E 'succ|open'
    done
done
