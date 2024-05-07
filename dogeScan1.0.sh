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
cat /dev/null > pings.txt
cat /dev/null > openPorts.txt
for i in $(seq $start $end)
do
    echo "Scanning $net.$i.XXX"
    for x in {1..254}
    do
        timeout 0.05 ping -c 1 $net.$i.$x 2>&1 | grep "bytes from" 2>&1 
        (timeout 0.05 ping -c 1 $net.$i.$x 2>&1 | grep "bytes from" 2>&1) | grep -E -o '([0-9]{1,3}\.){3}[0-9]{1,3}' >> pings.txt
    done
done

pStart="1"
pEnd="1000"
while IFS= read -r line; do
    echo "scanning $line"
    for ((i=$pStart; $i<=$pEnd; i++))
    do
        (timeout 0.01 nc -nvz $line $i 2>&1 | grep -E 'succ|open') | awk '{ print "ADDRESS: " $2 " PORT:" $3 " SERVICE:" $4 " STATUS: " $5 }' 
        (timeout 0.01 nc -nvz $line $i 2>&1 | grep -E 'succ|open') | awk '{ print "ADDRESS: " $2 " PORT:" $3 " SERVICE:" $4 " STATUS: " $5 }' >> openPorts.txt
    done
done < "pings.txt"
echo "Contents added to openPorts.txt"
