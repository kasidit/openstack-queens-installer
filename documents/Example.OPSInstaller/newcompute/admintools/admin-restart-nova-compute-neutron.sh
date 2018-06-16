# Openstack icehouse installation script 
# on ubuntu 14.04 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2014 
#
# run with sudo or as root.
#
#!/bin/bash -x
echo ovs-vsctl show 
ovs-vsctl show 
echo service openvswitch-switch restart
service openvswitch-switch restart
echo service nova-compute restart
service nova-compute restart
echo service openvswitch-switch restart
service openvswitch-switch restart
echo service neutron-openvswitch-agent restart
service neutron-openvswitch-agent restart
echo service neutron-metadata-agent restart
service neutron-metadata-agent restart
echo service neutron-dhcp-agent restart
service neutron-dhcp-agent restart
