# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2017  Kasidit Chanchio
#
#!/bin/bash -x 
#
intype=vasabi-1234install_type4321-ibasav
full=full
#
#ssh-keygen -t rsa
#
echo "create new public-private keys"
#
rm /home/vasabi-1234loginname4321-ibasav/.ssh/*
#
./expectssh-keygen.sh
#
echo "accept host keys"
./expectsshyesno.sh vasabi-1234loginname4321-ibasav controller 
./expectsshyesno.sh vasabi-1234loginname4321-ibasav network
./expectsshyesno.sh vasabi-1234loginname4321-ibasav compute
if [ "$intype" == "$full" ]
then 
./expectsshyesno.sh vasabi-1234loginname4321-ibasav compute1
fi

echo "propagate credentials"
sshpass -pvasabi-1234loginpassword4321-ibasav scp /home/vasabi-1234loginname4321-ibasav/.ssh/id_rsa.pub vasabi-1234loginname4321-ibasav@controller:/home/vasabi-1234loginname4321-ibasav/authorized_keys
sshpass -pvasabi-1234loginpassword4321-ibasav scp /home/vasabi-1234loginname4321-ibasav/.ssh/id_rsa.pub vasabi-1234loginname4321-ibasav@network:/home/vasabi-1234loginname4321-ibasav/authorized_keys
sshpass -pvasabi-1234loginpassword4321-ibasav scp /home/vasabi-1234loginname4321-ibasav/.ssh/id_rsa.pub vasabi-1234loginname4321-ibasav@compute:/home/vasabi-1234loginname4321-ibasav/authorized_keys
if [ "$intype" == "$full" ]
then 
sshpass -pvasabi-1234loginpassword4321-ibasav scp /home/vasabi-1234loginname4321-ibasav/.ssh/id_rsa.pub vasabi-1234loginname4321-ibasav@compute1:/home/vasabi-1234loginname4321-ibasav/authorized_keys
fi

sshpass -pvasabi-1234loginpassword4321-ibasav ssh  vasabi-1234loginname4321-ibasav@controller "(mkdir /home/vasabi-1234loginname4321-ibasav/.ssh; mv /home/vasabi-1234loginname4321-ibasav/authorized_keys /home/vasabi-1234loginname4321-ibasav/.ssh/authorized_keys)"
sshpass -pvasabi-1234loginpassword4321-ibasav ssh  vasabi-1234loginname4321-ibasav@network "(mkdir /home/vasabi-1234loginname4321-ibasav/.ssh; mv /home/vasabi-1234loginname4321-ibasav/authorized_keys /home/vasabi-1234loginname4321-ibasav/.ssh/authorized_keys)"
sshpass -pvasabi-1234loginpassword4321-ibasav ssh  vasabi-1234loginname4321-ibasav@compute "(mkdir /home/vasabi-1234loginname4321-ibasav/.ssh; mv /home/vasabi-1234loginname4321-ibasav/authorized_keys /home/vasabi-1234loginname4321-ibasav/.ssh/authorized_keys)"
if [ "$intype" == "$full" ]
then 
sshpass -pvasabi-1234loginpassword4321-ibasav ssh  vasabi-1234loginname4321-ibasav@compute1 "(mkdir /home/vasabi-1234loginname4321-ibasav/.ssh; mv /home/vasabi-1234loginname4321-ibasav/authorized_keys /home/vasabi-1234loginname4321-ibasav/.ssh/authorized_keys)"
fi
echo "check date time of controller network compute"
ssh  vasabi-1234loginname4321-ibasav@controller date
ssh  vasabi-1234loginname4321-ibasav@network date
ssh  vasabi-1234loginname4321-ibasav@compute date
if [ "$intype" == "$full" ]
then 
ssh  vasabi-1234loginname4321-ibasav@compute1 date
fi
echo "set sudoers"
sshpass -pvasabi-1234loginpassword4321-ibasav scp files/adjustsudoer.sh vasabi-1234loginname4321-ibasav@controller:/home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh
sshpass -pvasabi-1234loginpassword4321-ibasav scp files/adjustsudoer.sh vasabi-1234loginname4321-ibasav@network:/home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh
sshpass -pvasabi-1234loginpassword4321-ibasav scp files/adjustsudoer.sh vasabi-1234loginname4321-ibasav@compute:/home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh
if [ "$intype" == "$full" ]
then 
sshpass -pvasabi-1234loginpassword4321-ibasav scp files/adjustsudoer.sh vasabi-1234loginname4321-ibasav@compute1:/home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh
fi

./expectsetsudoer.sh vasabi-1234loginname4321-ibasav controller vasabi-1234loginpassword4321-ibasav
./expectsetsudoer.sh vasabi-1234loginname4321-ibasav network vasabi-1234loginpassword4321-ibasav
./expectsetsudoer.sh vasabi-1234loginname4321-ibasav compute vasabi-1234loginpassword4321-ibasav
if [ "$intype" == "$full" ]
then 
./expectsetsudoer.sh vasabi-1234loginname4321-ibasav compute1 vasabi-1234loginpassword4321-ibasav
fi

echo "set timezone of controller network compute"
ssh -t vasabi-1234loginname4321-ibasav@controller sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
ssh -t vasabi-1234loginname4321-ibasav@network sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
ssh -t vasabi-1234loginname4321-ibasav@compute sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
if [ "$intype" == "$full" ]
then 
ssh -t vasabi-1234loginname4321-ibasav@compute1 sudo timedatectl set-timezone vasabi-1234timezone4321-ibasav
fi

echo "set date of controller network compute"
ssh -t vasabi-1234loginname4321-ibasav@controller sudo date --set=\"$(date)\"
ssh -t vasabi-1234loginname4321-ibasav@network sudo date --set=\"$(date)\"
ssh -t vasabi-1234loginname4321-ibasav@compute sudo date --set=\"$(date)\"
if [ "$intype" == "$full" ]
then 
ssh -t vasabi-1234loginname4321-ibasav@compute1 sudo date --set=\"$(date)\"
fi
