# Different command-line programs usages examples

## jq - JSON processor [github](https://stedolan.github.io/jq/)
> echo "{\"f1\":{\"f2\":\"v2\"}}" | jq -r '.f1.f2' #will print v2

## netcat - networking utility
Its list of features includes port scanning, transferring files, and port listening, and it can be used as a backdoor.
Setting up a one-shot webserver:
> { printf 'HTTP/1.0 200 OK\r\nContent-Length: %d\r\n\r\n' "$(wc -c < some.file)"; cat some.file; } | nc -l 8080 \

Opening a raw connection to port 25
> nc mail.server.net 25

Check if we have access to specific ip:port
> nc -nv 10.100.80.27 1553

Simple server
> nc -l -p 3002

## nmap - network scanner [wiki](https://en.wikipedia.org/wiki/Netcat)
-A: Enable OS detection, version detection, script scanning, and traceroute. Scanning Top 1,000 TCP and UDP ports (nmap default).
> nmap -A scanme.nmap.org

-p: scans specified ports only
> nmap -p 50-60 192.168.5.102

## dos2unix - Text file format converters.
dos2unix - DOS/MAC to UNIX text file format converter \
unix2dos - UNIX to DOS/MAC text file format converter

## tcpdump - packet capture utility 
Common usage examples [here](https://docs.netgate.com/pfsense/en/latest/book/packetcapture/using-tcpdump-from-the-command-line.html) \
Capture all dns traffic: 
- -n disable reverse lookup 
- -i flag specifies the interface 
> tcpdump -ni wlan0 port 53

Capture all HTTP traffic to several hosts (combining filters):
> tcpdump -ni wlan0 host 192.168.1.11 or host 192.168.1.15 and tcp port 80

## html2text - preview html document in console
html2text index.html | less

## service - run a System V script
> service --status-all
> service redis-server start
### systemclt - service manager
> systemctl disable redis
