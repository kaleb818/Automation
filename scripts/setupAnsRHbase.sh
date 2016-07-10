sudo yum update -y
sudo yum install git -y
git clone git://github.com/ansible/ansible.git /home/jbus/ansible --recursive 
sudo source /home/jbus/ansible/hacking/env-setup
sudo easy_install pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six
sudo rpm -iUvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum install ansible -y
