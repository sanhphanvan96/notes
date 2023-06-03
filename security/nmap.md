```
nmap 192.168.1.1/24
nmap 192.168.1.1/24 | lolcat
nmap -p1-10000 192.168.1.0/24
nmap -p22,23,10000-15000 192.168.10.0/24
nmap -O network
nmap -oA output_file network

# ping scan, check if host is up, without port scan
nmap -sP network

# version scan
nmap -p1-10000 -sV host

```
