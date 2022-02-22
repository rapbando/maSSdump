#!/bin/sh


 masscan -p443 $1 -oG session.massdump  --rate=1000   
  if [[ $? -ne 0 ]] ; then
      exit 1
  fi
 grep -oP '(?<=Host: )\S*' session.massdump >openports.massdump 
 printf "[+] Looking up the certificate CNs for available hosts.....\n------------------------------------------------------------------------------------\n"
 echo
 ./cndump -f openports.massdump -u |& tee out.massdump.txt
 rm session.massdump openports.massdump
 printf  "\n------------------------------------------------------------------------------------\n"
 echo -n "Do you also want to grab banners?"
 echo
 function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
 }
 echo
  yes_or_no "$message" &&
  file=out.massdump.txt
 echo
  printf "[+] Grabbing banners and following redirects.....\n------------------------------------------------------------------------------------\n"
  while read line ; do
  
    ip=$( echo "$line" | cut -d ' ' -f 1 )
    whatweb $ip --log-brief=banners.massdump.txt
    printf  "\n------------------------------------------------------------------------------------\n"
    echo -n "BANNERS SAVED TO: banners.massdump.txt"
  done < ${file}
 echo
 COUNT=$(grep -c ".*" out.massdump.txt)  
 echo -n $COUNT "ENTRIES SAVED TO: out.massdump.txt"	       
 echo    
