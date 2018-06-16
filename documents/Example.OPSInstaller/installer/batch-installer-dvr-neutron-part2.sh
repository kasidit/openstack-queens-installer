#!/bin/bash -x
/bin/date
./OS-installer-01-node-setups.sh
./OS-installer-02-mysql.sh
./OS-installer-03-rabbitmq.sh
./OS-installer-04-keystone.sh
./OS-installer-05-glance.sh
./OS-installer-06-nova.sh
./OS-installer-07-neutron.sh
./OS-installer-08-set-dvr.sh
./OS-installer-09-initial-user-network.sh
./OS-installer-10-horizon.sh
/bin/date
printf "Done"
