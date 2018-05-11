# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
# run or with sudo as root.
#
#!/bin/bash -x
cd $HOME/OPSInstaller/controller
pwd
#
# set max connection error of mysql to a high value
#
#mysql -u root -pvasabilabMYSQL_PASS -e "SET GLOBAL max_connect_errors=10000;"
#
echo -n "* install rabbitmq.. press" 
#read varkey
apt-get -y install rabbitmq-server

echo -n "* set rabbitmq password for guest...press"
#read varkey
rabbitmqctl add_user openstack vasabilabRABBIT_PASS
rabbitmqctl set_permissions openstack ".*" ".*" ".*"

printf "* install memcache..press\n"
#read varkey
apt-get -y install memcached python-memcache
cp files/memcached.conf /etc/memcached.conf
service memcached restart

groupadd --system etcd
useradd --home-dir "/var/lib/etcd" \
      --system \
      --shell /bin/false \
      -g etcd \
      etcd
mkdir -p /etc/etcd
chown etcd:etcd /etc/etcd
mkdir -p /var/lib/etcd
chown etcd:etcd /var/lib/etcd
#
ETCD_VER=v3.2.7
rm -rf /tmp/etcd && mkdir -p /tmp/etcd
curl -L https://github.com/coreos/etcd/releases/download/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd --strip-components=1
cp /tmp/etcd/etcd /usr/bin/etcd
cp /tmp/etcd/etcdctl /usr/bin/etcdctl
#
cp files/etcd.conf.yml /etc/etcd/etcd.conf.yml
cp files/etcd.service /lib/systemd/system/etcd.service
systemctl enable etcd
systemctl start etcd
