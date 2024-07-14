#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"
while [ 1 ]
do
	#./report.sh
	./report_to_found_ips.sh
	sleep 5

done

