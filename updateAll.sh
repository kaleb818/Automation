#!/bin/bash
SERVERS=( 10.4.0.101 10.4.0.102 10.4.0.103 10.4.0.104 10.4.0.105 10.4.0.106 10.4.0.107 )

wget https://jkbdevops.blob.core.windows.net/files/jdk-7u75-linux-x64.tar.gz -P /home/jbus/Automation/ansible_hadoop_tarball/file_archives/

wget https://jkbdevops.blob.core.windows.net/files/hadoop-2.3.0-cdh5.1.2.tar.gz -P /home/jbus/Automation/ansible_hadoop_tarball/file_archives/

wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin -P /home/jbus/

scp /home/jbus/cloudera-manager-installer.bin jbus@10.4.0.101:cloudera-manager-installer.bin

for HOST in ${SERVERS[@]}; do
    scp /home/jbus/Automation/updateRH.sh jbus@${HOST}:updateRH.sh

	ssh jbus@${HOST} -t 'sudo chmod u+x /home/jbus/updateRH.sh'
	
    ssh jbus@${HOST} -t 'sudo /home/jbus/updateRH.sh'

    if [[ $? -ne 0 ]]; then
        echo "ERROR: $HOST did not complete"
     else
        echo "$HOST complete"
    fi
done
