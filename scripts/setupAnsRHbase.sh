yum update -y
yum install git -y
git clone git://github.com/ansible/ansible.git /home/jbus/ansible --recursive 
source /home/jbus/ansible/hacking/env-setup
easy_install pip
pip install paramiko PyYAML Jinja2 httplib2 six
rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum install ansible -y
