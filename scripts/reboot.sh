#!/bin/bash
SERVERS=( 10.4.0.111 10.4.0.112 10.4.0.113 10.4.0.114 10.4.0.115 10.4.0.116 10.4.0.117 )

for HOST in ${SERVERS[@]}; do

	ssh -o StrictHostKeyChecking=no root@${HOST} 'reboot'

    if [[ $? -ne 0 ]]; then
        echo "ERROR: $HOST did not complete"
     else
        echo "$HOST complete"
    fi
done
