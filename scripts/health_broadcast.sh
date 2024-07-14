#!/usr/bin/env bash


echo "Broadcasting health status"



#
#exit 0

echo "Getting ifconfig"

echo "{ \"ifconfig\": \"" > ifconfig.latest.txt
ifconfig >> ifconfig.latest.txt

echo "Getting top"

echo "\", \"top\": \"" >> ifconfig.latest.txt
top -bn 1 >> ifconfig.latest.txt

echo "Getting netstat"

echo "\", \"netstat\": \"" >> ifconfig.latest.txt
netstat >> ifconfig.latest.txt
echo "\"}" >> ifconfig.latest.txt

echo "Broadcasting..."
curl --location 'http://192.168.42.190:3000/health/report' --header 'Content-Type: application/json' --data '@./ifconfig.latest.txt'

echo "Broadcasted"
