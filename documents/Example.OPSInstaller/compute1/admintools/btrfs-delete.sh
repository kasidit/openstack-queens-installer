# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
#
btrfs subvolume delete /mnt/@_snap_${1}
btrfs subvolume delete /mnt/@home_snap_${1}
#
