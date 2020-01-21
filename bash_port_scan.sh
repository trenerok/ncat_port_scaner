#!/bin/bash

#Echo “enter your subnet”
echo "You provided $# arguments - scan ip range: $1 | port range: FROM $2 TO $3"
SUBNET=$1
PORT_FROM=$2
PORT_TO=$3


for IP in $(seq 1 254); do
	        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			echo "START scanning - $SUBNET.$IP"
            for PORT in $(seq $2 $3); do
            #echo "scanning - $SUBNET.$IP $PORT"
            ./ncat -nv -w 1 -i 1 $SUBNET.$IP $PORT 2>&1 | grep open
            done
            echo "FINISH scanning - $SUBNET.$IP"
done
echo "done"
