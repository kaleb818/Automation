# Update /etc/hosts

sudo cp /etc/hosts /etc/hosts.bkpz
sudo cp etc_new_hosts /etc/hosts


# Create Directories for NN/DN/JN

sudo mkdir -p /data1/nn /data1/jn

for item in 1 2 3 4 5 6;
do 
    sudo mkdir -p /data${item}/dn;
    sudo mkdir -p /data${item}/yarn/local;
    sudo mkdir -p /data${item}/yarn/logs;
    
    sudo chown hdadmin:hdadmin -R /data${item}/dn
    sudo chown hdadmin:hdadmin -R /data${item}/yarn
    
done;

# Change Directory Permissions.
sudo chown hdadmin:hdadmin /data1/nn
sudo chown hdadmin:hdadmin /data1/jn