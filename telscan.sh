#!/bin/bash
ls -la
echo "Filename of ips: "
read file

ips=($(awk '{print $1}' $file))
ports=(22 53 88 135 139 389 445 464 593 636 3288 3269 3389 5985 9389)

for ip in "${ips[@]}"; do 
  echo "Scanning $ip"
  for port in "${ports[@]}"; do
    echo quit | timeout 0.20 telnet $ip $port 2>/dev/null | grep -q "Connected" && echo -e "$ip:$port - \033[32mOPEN\033[0m" || echo -e "$ip:$port - \033[31mCLOSED\033[0m"
  done
echo ""
echo ""
echo ""
done
