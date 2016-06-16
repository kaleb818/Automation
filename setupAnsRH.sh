yum update -y
yum install git -y
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible/
source .ansible/hacking/env-setup
ansible/easy_install pip
pip install paramiko PyYAML Jinja2 httplib2 six
rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum install ansible -y
sudo rpm -iUvh https://jkbdevops.blob.core.windows.net/files/jdk-8u65-linux-x64.rpm