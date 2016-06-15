#disable firewall
service iptables save
service iptables stop
chkconfig iptables off

#set root pw
echo "SprPassw0rd123" | passwd root --stdin
