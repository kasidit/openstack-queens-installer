# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
#
mv /mnt/@ /mnt/@_badroot
mv /mnt/@home /mnt/@_badhome
#
mv /mnt/@_snapshot1 /mnt/@
mv /mnt/@home_snapshot1 /mnt/@home
#
echo "Rebooting host"
reboot
