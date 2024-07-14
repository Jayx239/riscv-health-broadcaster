#!/usr/bin/env bash

IP=$1

# arp -a | sed -En 's/.*\((.*)\).*/\1/p'


echo "{ \"ifconfig\": \"" > ifconfig.latest.txt
ifconfig >> ifconfig.latest.txt
echo "\", \"top\": \"" >> ifconfig.latest.txt
top -bn 1 >> ifconfig.latest.txt
echo "\", \"netstat\": \"" >> ifconfig.latest.txt
netstat >> ifconfig.latest.txt
echo "\"}" >> ifconfig.latest.txt
curl --location "http://$IP:3000/health/report" --header 'Content-Type: application/json' --data '@./ifconfig.latest.txt'
