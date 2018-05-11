# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
#!/bin/bash -x
echo ovs-vsctl show
ovs-vsctl show
echo service openvswitch-switch restart
service openvswitch-switch restart
echo service neutron-openvswitch-agent restart
service neutron-openvswitch-agent restart
echo service neutron-l3-agent restart
service neutron-l3-agent restart
