yum update -y
yum install git -y
git clone git://github.com/ansible/ansible.git /home/jbus/ansible --recursive 
source /home/jbus/ansible/hacking/env-setup
/home/jbus/ansible/easy_install pip
pip install paramiko PyYAML Jinja2 httplib2 six
rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum install ansible -y
sudo rpm -iUvh https://jkbdevops.blob.core.windows.net/files/jdk-8u65-linux-x64.rpm
git clone https://github.com/kaleb818/Automation.git /home/jbus/Automation --recursive
find /home/jbus/Automation -type f -exec sed -i 's/10.4.0.11/10.4.0.3/g' {} \;
