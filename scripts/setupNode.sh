#!/bin/bash

#get cloudera manager install file in case this will be the CM server
wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin -P /home/jbus/

#disable firewall
service iptables save
service iptables stop
chkconfig iptables off

#disable selinux
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

#Turn off sudo password for jbus
if [ -z "$1" ]; then
  echo "Starting up visudo with this script as first parameter"
  export EDITOR=$0 && sudo -E visudo
else
  echo "Changing sudoers"
  echo "jbus ALL=(ALL) NOPASSWD: ALL" >> $1
fi

#create the .ssh directory for passwordless key access
mkdir /home/jbus/.ssh

#copy the public key for passwordless access
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo66zeO/xoY5rybnpcpMST10HdZTdp39YMp1SvbwWAlY0hHCKCmXtllGwkrIrGbRiDgTXJOEh8/1/IhxsjWDlIUosGdWaC5zXrWjXlGPcoGPqi$' | cat >> /home/jbus/.ssh/authorized_keys

#set the permissions on the directories
chmod 700 .ssh; chmod 640 .ssh/authorized_keys
