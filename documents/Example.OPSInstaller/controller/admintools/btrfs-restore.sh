# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
#
mv /mnt/@ /mnt/@_badroot_of_snap_${1}
mv /mnt/@home /mnt/@_badhome_of_snap_${1}
#
mv /mnt/@_snap_${1} /mnt/@
mv /mnt/@home_snap_${1} /mnt/@home
#
echo "Rebooting host"
reboot
