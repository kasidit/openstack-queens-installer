# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
#!/bin/bash -x
#
#
echo "On network:"
ssh -t openstack@network sudo reboot 
echo "On compute:"
ssh -t openstack@compute sudo reboot 
echo "On compute1:"
ssh -t openstack@compute1 sudo reboot 
echo "On controller: this terminal session will terminate!"
ssh -t openstack@controller sudo reboot 
