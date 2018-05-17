#!/bin/bash 
#
# OpenStack Installation script (parameter definition)
#
# copyright 2017 kasidit chanchio, vasabilab 
# http://vasabilab.cs.tu.ac.th
# Department of Computer Science, 
# Faculty of Science and Technology, Thammasat University
#
export INSTALL_TYPE=full
export NETWORK_TYPE=dvr_ovs
export PASSWD_TYPE=studypass
#
# There are two kinds of installation: full or compact.
# Full has 2 compute node, while compact has only 1 compute. 
# There are also two types of network: classic_ovs or dvr_ovs.
# classic_ovs has no HA capability. dvr_ovs represents the 
# distributed virtual router HA capability. 
# The password is either "randompass" or "studypass" (default). 
# The "randompass" produces randomly generated passwords for 
# openstack components while "studypass" generates readable 
# password for learning and debugging.
#
export OPS_LOGIN_NAME=openstack
export OPS_LOGIN_PASS=openstack
export OPS_TIMEZONE=Asia\\/Bangkok
#
export OPS_MYSQL_PASS=mysqlpassword
export DEMO_PASS=demopassword
export ADMIN_PASS=adminpassword
#
export HYPERVISOR=qemu
#
export INIT_IMAGE_LOCATION=http:\\/\\/download.cirros-cloud.net\\/0.3.5\\/cirros-0.3.5-x86_64-disk.img
export INIT_IMAGE_NAME=cirros
#
export DOMAINNAME=cs.tu.ac.th
#
# Ubuntu Repository Parameters
#
export LOCAL_REPO=th.archive.ubuntu.com
export LOCAL_SECURITY_REPO=security.ubuntu.com
#
# ntp servers
export NTP_SERVER0=0.th.pool.ntp.org
export NTP_SERVER1=1.th.pool.ntp.org
export NTP_SERVER2=2.th.pool.ntp.org
export NTP_SERVER3=3.th.pool.ntp.org
#
# Deprecate
export NTP_SERVER_LOCAL=10.0.10.126 
#
# Management Network
#
export MANAGEMENT_NETWORK_NETMASK=255.255.255.0
export MANAGEMENT_NETWORK=10.201.0.0
export MANAGEMENT_BROADCAST_ADDRESS=10.201.0.255 
export DNS_IP=8.8.8.8
#
# ---- gateway host ----
#
# (Deprecated) The GATEWAY_IP_NIC is only used when you use the controller 
# to simulate a network gateway.
#
export GATEWAY_IP_NIC=ens3
#
# ---- controller host ----
#
export CONTROLLER_IP=10.201.0.11
export CONTROLLER_IP_NIC=ens3
#
# This GATEWAY_IP define the IP addr of the gateway of 
# the management network on every node.
#
export GATEWAY_IP=10.201.0.1
#
#
# ---- network host ----
#
export NETWORK_IP=10.201.0.21
export NETWORK_IP_NIC=ens3
#
export DATA_TUNNEL_NETWORK_NODE_IP=10.0.11.21
export DATA_TUNNEL_NETWORK_NODE_IP_NIC=ens4
export DATA_TUNNEL_NETWORK_ADDRESS=10.0.11.0
export DATA_TUNNEL_NETWORK_NETMASK=255.255.255.0
export VLAN_NETWORK_NODE_IP_NIC=ens5
#
export EXTERNAL_CIDR=10.201.0.0\\/24
export EXTERNAL_CIDR_NIC=ens6
export EXTERNAL_GATEWAY_IP=10.201.0.1
#
export START_FLOATING_IP=10.201.0.100
export END_FLOATING_IP=10.201.0.200
#
# ---- compute host ----
#
export COMPUTE_IP=10.201.0.31
export COMPUTE_IP_NIC=ens3
export DATA_TUNNEL_COMPUTE_NODE_IP=10.0.11.31
export DATA_TUNNEL_COMPUTE_NODE_IP_NIC=ens4
export VLAN_COMPUTE_NODE_IP_NIC=ens5
#
# For DVR, the EXTERNAL_CIDR* of network node is used on every compute node.
#
# ---- compute1 host ----
#
export COMPUTE1_IP=10.201.0.32
export COMPUTE1_IP_NIC=ens3
export DATA_TUNNEL_COMPUTE1_NODE_IP=10.0.11.32
export DATA_TUNNEL_COMPUTE1_NODE_IP_NIC=ens4
export VLAN_COMPUTE1_NODE_IP_NIC=ens5
