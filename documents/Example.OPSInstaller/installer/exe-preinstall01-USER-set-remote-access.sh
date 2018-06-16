# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x 
#
intype=full
full=full
#
#ssh-keygen -t rsa
#
echo "create new public-private keys"
#
rm /home/openstack/.ssh/*
#
./expectssh-keygen.sh
#
echo "accept host keys"
./expectsshyesno.sh openstack controller 
./expectsshyesno.sh openstack network
./expectsshyesno.sh openstack compute
if [ "$intype" == "$full" ]
then 
./expectsshyesno.sh openstack compute1
fi

echo "propagate credentials"
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@controller:/home/openstack/authorized_keys
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@network:/home/openstack/authorized_keys
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@compute:/home/openstack/authorized_keys
if [ "$intype" == "$full" ]
then 
sshpass -popenstack scp /home/openstack/.ssh/id_rsa.pub openstack@compute1:/home/openstack/authorized_keys
fi

sshpass -popenstack ssh  openstack@controller "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
sshpass -popenstack ssh  openstack@network "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
sshpass -popenstack ssh  openstack@compute "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
if [ "$intype" == "$full" ]
then 
sshpass -popenstack ssh  openstack@compute1 "(mkdir /home/openstack/.ssh; mv /home/openstack/authorized_keys /home/openstack/.ssh/authorized_keys)"
fi
echo "check date time of controller network compute"
ssh  openstack@controller date
ssh  openstack@network date
ssh  openstack@compute date
if [ "$intype" == "$full" ]
then 
ssh  openstack@compute1 date
fi
echo "set sudoers"
sshpass -popenstack scp files/adjustsudoer.sh openstack@controller:/home/openstack/adjustsudoer.sh
sshpass -popenstack scp files/adjustsudoer.sh openstack@network:/home/openstack/adjustsudoer.sh
sshpass -popenstack scp files/adjustsudoer.sh openstack@compute:/home/openstack/adjustsudoer.sh
if [ "$intype" == "$full" ]
then 
sshpass -popenstack scp files/adjustsudoer.sh openstack@compute1:/home/openstack/adjustsudoer.sh
fi

./expectsetsudoer.sh openstack controller openstack
./expectsetsudoer.sh openstack network openstack
./expectsetsudoer.sh openstack compute openstack
if [ "$intype" == "$full" ]
then 
./expectsetsudoer.sh openstack compute1 openstack
fi

echo "set timezone of controller network compute"
ssh -t openstack@controller sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
ssh -t openstack@network sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
ssh -t openstack@compute sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
if [ "$intype" == "$full" ]
then 
ssh -t openstack@compute1 sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
fi

echo "set date of controller network compute"
ssh -t openstack@controller sudo date --set=\"$(date)\"
ssh -t openstack@network sudo date --set=\"$(date)\"
ssh -t openstack@compute sudo date --set=\"$(date)\"
if [ "$intype" == "$full" ]
then 
ssh -t openstack@compute1 sudo date --set=\"$(date)\"
fi
