#!/bin/bash
#created by Phantom115
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

echo "Enter First 2 octets for the ping sweep: "
read net
echo "Enter the start of the range for the 3rd octet: "
read start
echo "Enter the end of the range for the 3rd octet: "
read end
for i in $(seq $start $end)
do
    echo "Scanning $net.$i.XXX"
    for x in {1..254}
    do
        timeout 0.05 ping -c 1 $net.$i.$x 2>&1 | grep "bytes from" 2>&1 
    done
done
