#!/bin/bash

#disable sudo password for jbus
echo 'jbus ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#disable firewall
service iptables save
service iptables stop
chkconfig iptables off

#disable selinux
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

reboot