# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#
#!/bin/bash -x
echo service nova-api restart
service nova-api restart
echo service neutron-server restart
service neutron-server restart
