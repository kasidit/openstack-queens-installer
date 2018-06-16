# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x
#
#
newHostname=${1}
newHostManagementIP=${2}
newHostDataTunnelIP=${3}
#
echo "You are required the management network IP address ${newHostManagementIP} and ${newHostname} hostname in /etc/hosts file of this host."
echo "This script assume that the same hostname and IP addressed are already defined at the destination."
#
echo "delete hostname and IP from knownhost if any"
ssh-keygen -R ${newHostname}
ssh-keygen -R ${newHostManagementIP}
#
echo "accept host keys"
./expectsshyesno.sh openstack ${newHostname}

echo "propagate credentials"
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@${newHostname}:/home/openstack/authorized_keys
#
sshpass -popenstack ssh  openstack@${newHostname} "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
#
echo "check date time of new compute node"
ssh  openstack@${newHostname} date
#
echo "set sudoers"
sshpass -popenstack scp files/adjustsudoer.sh openstack@${newHostname}:/home/openstack/adjustsudoer.sh
#
./expectsetsudoer.sh openstack ${newHostname} openstack
#
echo "set timezone on the new compute node"
ssh -t openstack@${newHostname} sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav

echo "set date of the new compute node"
ssh -t openstack@${newHostname} sudo date --set=\"$(date)\"
#
#-----section 2
#
echo "copy installer tarball to the new compute node"
#read varkey
scp OPSInstaller.tar openstack@${newHostname}:/home/openstack/OPSInstaller.tar
#
echo "remove existing OPSInstaller on the new compute node"
ssh openstack@${newHostname} rm -rf /home/openstack/OPSInstaller 
#
echo "extract installer files on the new compute node."
ssh openstack@${newHostname} tar xvf /home/openstack/OPSInstaller.tar 
echo "replace parameters on the new compute node."
ssh openstack@${newHostname} /home/openstack/OPSInstaller/replace-newcompute-genericnames.sh ${newHostname} ${newHostManagementIP} ${newHostDataTunnelIP}
ssh openstack@${newHostname} /home/openstack/OPSInstaller/remove-all-except-newcompute.sh 
#
ssh -t openstack@${newHostname}  sudo /bin/bash -x ./OPSInstaller/newcompute/exe-stage00-SUDO-update.sh | tee log/s00-${newHostname}.log
printf "\n\nThis step reboots ${newHostname}! \nWait until the rebooted node resume and proceed to run ./OS-newcompute-01-nova-neutron-ovs.sh \n"
