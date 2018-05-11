# OpenStack ocata installation script 
# on Ubuntu 16.04.2 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
echo "Run this script as a user."
echo -n "* create Identity service and endpoint...press"
#read varkey

export OS_USERNAME=admin
export OS_PASSWORD=adminpassword
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://controller:35357/v3
export OS_IDENTITY_API_VERSION=3

echo -n "* create Admin projects, users, and roles...press"
#read varkey
openstack project create --domain default --description "Service Project" service
openstack project create --domain default --description "Demo Project" demo
openstack user create --domain default --password demopassword demo
openstack role create user
openstack role add --project demo --user demo user

printf "\n5. Verify keystone Id Service...get a token by user id... press any key"
#read varkey

sudo cp files/keystone-paste.ini /etc/keystone/keystone-paste.ini

unset OS_AUTH_URL OS_PASSWORD

openstack --os-auth-url http://controller:35357/v3 \
  --os-project-domain-name default --os-user-domain-name default \
  --os-project-name admin --os-username admin --os-password adminpassword token issue

openstack --os-auth-url http://controller:5000/v3 \
  --os-project-domain-name default --os-user-domain-name default \
  --os-project-name demo --os-username demo --os-password demopassword token issue

