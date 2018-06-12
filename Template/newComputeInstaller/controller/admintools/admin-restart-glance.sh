# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
#
echo service glance-registry restart
service glance-registry restart
echo service glance-api restart
service glance-api restart
#
