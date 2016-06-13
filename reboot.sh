#!/bin/bash
SERVERS=( 10.4.0.101 10.4.0.102 10.4.0.103 10.4.0.104 10.4.0.105 10.4.0.106 10.4.0.107 )

for HOST in ${SERVERS[@]}; do

	ssh -o StrictHostKeyChecking=no root@${HOST} 'reboot'

    if [[ $? -ne 0 ]]; then
        echo "ERROR: $HOST did not complete"
     else
        echo "$HOST complete"
    fi
done
