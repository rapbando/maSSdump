#!/bin/sh


 masscan -p443 $1 -oG session.massdump  --rate=1000   
  if [[ $? -ne 0 ]] ; then
      exit 1
  fi
 grep -oP '(?<=Host: )\S*' session.massdump >openports.massdump 
 printf "[+] Looking up the certificate CNs for available hosts.....\n---------------------------------------------------------------------\n"
 echo
 ./cndump -f openports.massdump -u |& tee out.massdump.txt
 rm session.massdump openports.massdump
 printf "\n---------------------------------------------------------------------\nSaved  domains to: out.massdump.txt\n" 
 echo -n "FINISH!!!"
 echo          


