#!/bin/bash
#This script was developed by Phantom115
#SET THE STARTING OCTET HERE
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

net="192.168.10"
echo "Scanning $net network, enter last octet start: "
read nStart
echo "Enter last octet end: "
read nEnd

echo "scanning $net.$nStart - $nEnd"
pStart="1"
pEnd="1000"

for ((x=$nStart; $x<=$nEnd; x++))
do
    echo "Scanning $net.$x"
    for ((i=$pStart; $i<=$pEnd; i++))
    do
        timeout 0.01 nc -nvz $net.$x $i 2>&1 | grep -E 'succ|open'
    done
done
