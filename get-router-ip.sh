#!/bin/bash

#This script is trying to get an IP address of your router.
#List contains almost all router brands login IP-s.

trap "echo ' $0 execution is stopped' 2>&1; exit 1; " SIGINT SIGTERM

declare -a ips
ips=(
192.168.1.1   192.168.0.1     192.168.0.10    192.168.0.100
192.168.0.101 192.168.0.227   192.168.0.254   192.168.0.3
192.168.0.30  192.168.0.50    192.168.100.1   192.168.100.100
192.168.10.1  192.168.10.10   192.168.10.100  192.168.102.1
192.168.10.50 192.168.1.10    192.168.1.100   192.168.11.1
192.168.1.200 192.168.1.210   192.168.123.254 192.168.1.254
192.168.15.1  192.168.16.1    192.168.168.168 192.168.1.99
192.168.20.1  192.168.2.1     192.168.223.100 192.168.2.254
192.168.251.1 192.168.254.254 192.168.30.1    192.168.3.1
192.168.4.1   192.168.50.1    192.168.55.1    192.168.62.1
192.168.8.1   200.200.200.5   10.0.0.1        10.0.0.138
10.0.0.2      10.0.1.1        10.10.1.1       10.1.10.1
10.1.1.1      10.90.90.90
)
for ip in ${ips[*]}; do
	echo "Trying: $ip"
	ping -c 1 -W 1 -q "$ip" > /dev/null
	if [[ $? == 0 ]]; then
		echo "Ping OK. Possible router ip is: $ip"

		read -p "Continue search? [Y or N]> "

		case "$REPLY" in
			y|Y) echo "Continue ..."
				continue
				;;
			*) echo 'Exit.'
				exit
				;;
			esac
		exit
	fi
done

#echo "Unknown router vendor or your router is not visible from this net."
echo "End of list."
exit 1
