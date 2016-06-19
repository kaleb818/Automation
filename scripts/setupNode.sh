#!/bin/bash


if [ -z "$1" ]; then
  echo "Starting up visudo with this script as first parameter"
  export EDITOR=$0 && sudo -E visudo
else
  echo "Changing sudoers"
  echo "jbus ALL=(ALL) NOPASSWD: ALL" >> $1

  #get cloudera manager install file in case this will be the CM server
  wget http://archive.cloudera.com/cm5/installer/latest/cloudera-manager-installer.bin -P /home/jbus/

  #disable firewall
  service iptables save
  service iptables stop
  chkconfig iptables off

  #disable selinux
  sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

  #create the ssh directory
  mkdir /home/jbus/.ssh

  #change the owner of the ssh directory
  chown -R jbus:jbus /home/jbus/.ssh

  #copy the public key for passwordless access
  echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAo66zeO/xoY5rybnpcpMST10HdZTdp39YMp1SvbwWAlY0hHCKCmXtllGwkrIrGbRiDgTXJOEh8/1/IhxsjWDlIUosGdWaC5zXrWjXlGPcoGPqi+lK0kUvFgZfTtUEpnh0tWv+mWDcstO5KGhB10cnqoP8SjHcErBF6y/WQdCcil1vw97wxJ8sKfA0Sn1+KNpZCTnPWOnGjF3BF/U/mTP0Z97YUoQGzqu5+/TFHCsC7J8v/RMWx4oUR0UtXlgvpbFNpnD91Q9hCBhGX+H4gvNUDeWBqtBSPCk6fVUbNIRe05mtwdyib8K/XM06CBLrGu4g+OjIVVmvh2yR0/upMi0yDQ== jbus@jkbsssans' | cat >> /home/jbus/.ssh/authorized_keys

  #set the permissions on the directories
  echo "changing permissions on .ssh"
  chmod 700 .ssh; chmod 640 .ssh/authorized_keys
  
  reboot

fi
