#!/bin/bash
echo "What command would you like to encode? "
read command
enccmd=$(echo $command | base64)

echo "How many iterations? "
read counter
for (( i=1; i<=$counter; i++)); do
  start=$(date +%s%N)
  echo 'iex $($x=[Convert]::FromBase64String("'$enccmd'");$y=[System.Text.Encoding]::UTF8.GetString($x);$y)' > commanded.ps1
  enccmd=$(cat commanded.ps1 | base64)
  end=$(date +%s%N)
  echo "Time elapsed for loop $i: $(($((end - start)) / 1000000)) ms"
  done

start=$(date +%s%N)
pwsh commanded.ps1
end=$(date +%s%N)
echo ""
echo ""
echo "Time elapsed to run the encoded command: $(($((end - start)) / 1000000)) ms"
