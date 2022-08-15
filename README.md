# maSSdump
Tool for harvesting common names from SSL certificates providing IP ranges (fast reverse lookup scanner/enumerator for secure domains) that also grabs and saves banners if you say so.

#!/usr/bin/sh

This script requires two main tools:

MASSCAN https://github.com/robertdavidgraham/masscan 
CNDUMP https://github.com/bruston/cndump 

and some unix utilities.

INSTALLATION:

It is reccomended to install cloning main tools from github,
if you are in a hurry and/or have already masscan (i.e. from KALI) you can use my CNDUMP binary here (after flagging it secure for execution).



USAGE: `sudo maSSdump.sh ip/port` or `sudo maSSdump.sh ip_start-ip_stop` 


