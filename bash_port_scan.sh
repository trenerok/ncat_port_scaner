#!/bin/bash

#Echo “enter your subnet”
echo "You provided $# arguments - scan ip range: $1 | port range: FROM $2 TO $3"
SUBNET=$1
PORT_FROM=$2
PORT_TO=$3
FILENAME=result_ncat_scan_$1.log


for IP in $(seq 1 254); do
	        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$FILENAME"
			echo "START scanning - $SUBNET.$IP" >> "$FILENAME"
            for PORT in $(seq $2 $3); do
            #echo "scanning - $SUBNET.$IP $PORT"
            ./ncat -nv -w 1 -i 1 $SUBNET.$IP $PORT 2>&1 | grep Connected
            done
            echo "FINISH scanning - $SUBNET.$IP" >> "$FILENAME"
done
echo "done" >> "$FILENAME"
