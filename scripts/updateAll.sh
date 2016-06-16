#!/bin/bash
SERVERS=( 10.4.0.111 10.4.0.112 10.4.0.113 10.4.0.114 10.4.0.115 10.4.0.116 10.4.0.117 )

wget https://jkbdevops.blob.core.windows.net/files/jdk-7u75-linux-x64.tar.gz -P /home/jbus/Automation/ansible_hadoop_tarball/file_archives/

wget https://jkbdevops.blob.core.windows.net/files/hadoop-2.3.0-cdh5.1.2.tar.gz -P /home/jbus/Automation/ansible_hadoop_tarball/file_archives/

wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin -P /home/jbus/

scp /home/jbus/cloudera-manager-installer.bin jbus@$SERVERS:cloudera-manager-installer.bin

for HOST in ${SERVERS[@]}; do
    scp /home/jbus/Automation/updateRH.sh jbus@${HOST}:updateRH.sh

	ssh -o StrictHostKeyChecking=no jbus@${HOST} -t 'sudo chmod u+x /home/jbus/updateRH.sh; sudo /home/jbus/updateRH.sh;  sudo sed -i --follow-symlinks '"'"'s/^SELINUX=.*/SELINUX=disabled/g'"'"' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux'
	
    #ssh -o StrictHostKeyChecking=no jbus@${HOST} -t 'sudo /home/jbus/updateRH.sh'

    if [[ $? -ne 0 ]]; then
        echo "ERROR: **************$HOST did not complete***************"
     else
        echo "**************$HOST complete**************"
    fi
done
