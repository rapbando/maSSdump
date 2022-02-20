# maSSdump
Tool for harvesting common names from SSL  certificates providing IP ranges  (scanner for secure domains) 
#!/usr/bin/sh

# -1 run maSSdump with CIDR notation from stdin 
# -2 tell masscan to save output and wait masscan to finish finding hosts 
# -3 open masscan file containing reachable hosts with port 443 open
# -4 connect in parallel to hosts and read common name(s) with cndump 
# -5 OPTIONAL: save CNs to file
