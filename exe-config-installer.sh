#!/bin/bash 
#
# OpenStack Installation script 
#
# copyright 2017 kasidit chanchio, vasabilab, 
# http://vasabilab.cs.tu.ac.th
# Department of Computer Science, 
# Faculty of Science and Technology, Thammasat University
#
. ./install-paramrc.sh
#
export ORIINSTALL_TYPE=vasabi-1234install_type4321-ibasav
export ORINETWORK_TYPE=vasabi-1234network_type4321-ibasav
export ORILOGINNAME=vasabi-1234loginname4321-ibasav
export ORILOGINPASS=vasabi-1234loginpassword4321-ibasav
export ORITIMEZONE=vasabi-1234timezone4321-ibasav
#
export ORINTP_SERVER0=vasabi-1234-ntp-pool-server0-4321-ibasav
export ORINTP_SERVER1=vasabi-1234-ntp-pool-server1-4321-ibasav
export ORINTP_SERVER2=vasabi-1234-ntp-pool-server2-4321-ibasav
export ORINTP_SERVER3=vasabi-1234-ntp-pool-server3-4321-ibasav
#
export ORIHYPERVISOR=vasabi-1234hypervisor4321-ibasav
export ORIINIT_IMAGE_LOCATION=vasabi-1234init_image_location4321-ibasav
export ORIINIT_IMAGE_NAME=vasabi-1234init_image_name4321-ibasav
export ORIOPS_MYSQL_PASS=vasabilabMYSQL_PASS
export ORIDEMO_PASS=vasabilabDEMO_PASS
export ORIADMIN_PASS=vasabilabADMIN_PASS
export ORIDOMAINNAME=vasabi-1234domainname4321-ibasav
export ORIGATEWAY_IP=vasabi-1234gateway_ip4321-ibasav
export ORIEXTERNAL_GATEWAY_IP=vasabi-1234external_gateway_ip4321-ibasav
export ORICONTROLLER_IP=vasabi-1234controller_ip4321-ibasav
export ORINETWORK_IP=vasabi-1234network_ip4321-ibasav
export ORICOMPUTE_IP=vasabi-1234compute_ip4321-ibasav
export ORICOMPUTE1_IP=vasabi-1234compute1_ip4321-ibasav
export ORIEXTERNAL_CIDR=vasabi-1234external_cidr4321-ibasav
export ORIMANAGEMENT_NETWORK=vasabi-1234management_network4321-ibasav
export ORISTART_FLOATING_IP=vasabi-1234start_floating_ip4321-ibasav
export ORIEND_FLOATING_IP=vasabi-1234end_floating_ip4321-ibasav
export ORIGATEWAY_IP=vasabi-1234gateway_ip4321-ibasav
export ORIMANAGEMENT_BROADCAST_ADDRESS=vasabi-1234broadcast_address4321-ibasav
export ORIDATA_TUNNEL_NETWORK_NODE_IP=vasabi-1234data_tunnel_network_node_ip4321-ibasav
export ORIDATA_TUNNEL_COMPUTE_NODE_IP=vasabi-1234data_tunnel_compute_node_ip4321-ibasav
export ORIDATA_TUNNEL_COMPUTE1_NODE_IP=vasabi-1234data_tunnel_compute1_node_ip4321-ibasav
export ORIDATA_TUNNEL_NETWORK_ADDRESS=vasabi-1234data_tunnel_network_address4321-ibasav
export ORILOCAL_REPO=vasabi-1234local_repo4321-ibasav
export ORILOCAL_SECURITY_REPO=vasabi-1234local_security_repo4321-ibasav
export ORIMANAGEMENT_NETWORK_NETMASK=vasabi-1234management_network_netmask4321-ibasav
export ORIDATA_TUNNEL_NETWORK_NETMASK=vasabi-1234data_network_netmask4321-ibasav
export ORIDNS_IP=vasabi-1234dns_ip4321-ibasav
#
export ORICONTROLLER_IP_NIC=vasabi-1234controller_ip_nic4321-ibasav
export ORINETWORK_IP_NIC=vasabi-1234network_ip_nic4321-ibasav
export ORIDATA_TUNNEL_NETWORK_NODE_IP_NIC=vasabi-1234data_tunnel_network_node_ip_nic4321-ibasav
export ORIVLAN_NETWORK_NODE_IP_NIC=vasabi-1234vlan_network_node_ip_nic4321-ibasav
export ORIEXTERNAL_CIDR_NIC=vasabi-1234external_cidr_nic4321-ibasav
export ORICOMPUTE_IP_NIC=vasabi-1234compute_ip_nic4321-ibasav
export ORICOMPUTE1_IP_NIC=vasabi-1234compute1_ip_nic4321-ibasav
export ORIDATA_TUNNEL_COMPUTE_NODE_IP_NIC=vasabi-1234data_tunnel_compute_node_ip_nic4321-ibasav
export ORIDATA_TUNNEL_COMPUTE1_NODE_IP_NIC=vasabi-1234data_tunnel_compute1_node_ip_nic4321-ibasav
export ORIVLAN_COMPUTE_NODE_IP_NIC=vasabi-1234vlan_compute_node_ip_nic4321-ibasav
export ORIVLAN_COMPUTE1_NODE_IP_NIC=vasabi-1234vlan_compute1_node_ip_nic4321-ibasav
#
# extract the initial OPSInstaller directory
#
printf "\nExtract the initial OPSInstaller directory\nPress a key\n"
#read varkey

#
tar xvf OPSInstaller-init.tar 
#
printf "\nAssign password values\nsubstitution\n"
#read varkey

#
./config.d/exe-config-passwd.sh
#read varkey
#
printf "\nAssign parameter values\nsubstitution\n"
#
# Script to define parameter values below
#
ETC_FILES=OPSInstaller/*/files/*
CONTROLLER_ETC_FILES=OPSInstaller/controller/files/*
#
SCRIPT_FILES=OPSInstaller/*/*.sh
CONTROLLER_SCRIPT_FILES=OPSInstaller/controller/*.sh
#
# Change INSTALL_TYPE 
#
#read varkey
CHANGETOPIC=INSTALL_TYPE
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIINSTALL_TYPE}/${INSTALL_TYPE}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"
#read varkey
#
printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIINSTALL_TYPE}/${INSTALL_TYPE}/g" ${SCRIPT_FILES}
#read varkey
#
# Change NETWORK_TYPE 
#
CHANGETOPIC=NETWORK_TYPE
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORINETWORK_TYPE}/${NETWORK_TYPE}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"
#
printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORINETWORK_TYPE}/${NETWORK_TYPE}/g" ${SCRIPT_FILES}
#read varkey
#
# Change CONTROLLER_IP_NIC 
#
CHANGETOPIC=CONTROLLER_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORICONTROLLER_IP_NIC}/${CONTROLLER_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORICONTROLLER_IP_NIC}/${CONTROLLER_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change NETWORK_IP_NIC 
#
CHANGETOPIC=NETWORK_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORINETWORK_IP_NIC}/${NETWORK_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORINETWORK_IP_NIC}/${NETWORK_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change DATA_TUNNEL_NETWORK_NODE_IP_NIC 
#
CHANGETOPIC=DATA_TUNNEL_NETWORK_NODE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_NODE_IP_NIC}/${DATA_TUNNEL_NETWORK_NODE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_NODE_IP_NIC}/${DATA_TUNNEL_NETWORK_NODE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
CHANGETOPIC=VLAN_NETWORK_NODE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIVLAN_NETWORK_NODE_IP_NIC}/${VLAN_NETWORK_NODE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIVLAN_NETWORK_NODE_IP_NIC}/${VLAN_NETWORK_NODE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change EXTERNAL_CIDR_NIC 
#
CHANGETOPIC=EXTERNAL_CIDR_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIEXTERNAL_CIDR_NIC}/${EXTERNAL_CIDR_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIEXTERNAL_CIDR_NIC}/${EXTERNAL_CIDR_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change COMPUTE_IP_NIC 
#
CHANGETOPIC=COMPUTE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORICOMPUTE_IP_NIC}/${COMPUTE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORICOMPUTE_IP_NIC}/${COMPUTE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change DATA_TUNNEL_COMPUTE_NODE_IP_NIC 
#
CHANGETOPIC=DATA_TUNNEL_COMPUTE_NODE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE_NODE_IP_NIC}/${DATA_TUNNEL_COMPUTE_NODE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE_NODE_IP_NIC}/${DATA_TUNNEL_COMPUTE_NODE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
CHANGETOPIC=VLAN_COMPUTE_NODE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIVLAN_COMPUTE_NODE_IP_NIC}/${VLAN_COMPUTE_NODE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIVLAN_COMPUTE_NODE_IP_NIC}/${VLAN_COMPUTE_NODE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change COMPUTE1_IP_NIC 
#
CHANGETOPIC=COMPUTE1_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORICOMPUTE1_IP_NIC}/${COMPUTE1_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORICOMPUTE1_IP_NIC}/${COMPUTE1_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change DATA_TUNNEL_COMPUTE1_NODE_IP_NIC 
#
CHANGETOPIC=DATA_TUNNEL_COMPUTE1_NODE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE1_NODE_IP_NIC}/${DATA_TUNNEL_COMPUTE1_NODE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE1_NODE_IP_NIC}/${DATA_TUNNEL_COMPUTE1_NODE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
CHANGETOPIC=VLAN_COMPUTE1_NODE_IP_NIC
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIVLAN_COMPUTE1_NODE_IP_NIC}/${VLAN_COMPUTE1_NODE_IP_NIC}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIVLAN_COMPUTE1_NODE_IP_NIC}/${VLAN_COMPUTE1_NODE_IP_NIC}/g" ${SCRIPT_FILES}
#read varkey
#
# Change OPS_LOGIN_NAME 
#
CHANGETOPIC=OPS_LOGIN_NAME
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORILOGINNAME}/${OPS_LOGIN_NAME}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORILOGINNAME}/${OPS_LOGIN_NAME}/g" ${SCRIPT_FILES}
#read varkey
#
# Change OPS_LOGIN_PASS 
#
CHANGETOPIC=OPS_LOGIN_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORILOGINPASS}/${OPS_LOGIN_PASS}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORILOGINPASS}/${OPS_LOGIN_PASS}/g" ${SCRIPT_FILES}
#read varkey
#
# Change OPS_TIMEZONE 
#
CHANGETOPIC=OPS_TIMEZONE
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORITIMEZONE}/${OPS_TIMEZONE}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORITIMEZONE}/${OPS_TIMEZONE}/g" ${SCRIPT_FILES}
#read varkey
#
# Change NTP_SERVER0 
#
CHANGETOPIC=NTP_SERVER0
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORINTP_SERVER0}/${NTP_SERVER0}/g" ${CONTROLLER_ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORINTP_SERVER0}/${NTP_SERVER0}/g" ${CONTROLLER_SCRIPT_FILES}
#read varkey
#
# Change NTP_SERVER1 
#
CHANGETOPIC=NTP_SERVER1
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORINTP_SERVER1}/${NTP_SERVER1}/g" ${CONTROLLER_ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORINTP_SERVER1}/${NTP_SERVER1}/g" ${CONTROLLER_SCRIPT_FILES}
#read varkey
#
# Change NTP_SERVER2 
#
CHANGETOPIC=NTP_SERVER2
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORINTP_SERVER2}/${NTP_SERVER2}/g" ${CONTROLLER_ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORINTP_SERVER2}/${NTP_SERVER2}/g" ${CONTROLLER_SCRIPT_FILES}
#read varkey
#
# Change NTP_SERVER3 
#
CHANGETOPIC=NTP_SERVER3
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORINTP_SERVER3}/${NTP_SERVER3}/g" ${CONTROLLER_ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORINTP_SERVER3}/${NTP_SERVER3}/g" ${CONTROLLER_SCRIPT_FILES}
#read varkey
#
# Change HYPERVISOR 
#
CHANGETOPIC=HYPERVISOR
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIHYPERVISOR}/${HYPERVISOR}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIHYPERVISOR}/${HYPERVISOR}/g" ${SCRIPT_FILES}
#read varkey
#
# Change INIT_IMAGE_LOCATION 
#
CHANGETOPIC=INIT_IMAGE_LOCATION
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIINIT_IMAGE_LOCATION}/${INIT_IMAGE_LOCATION}/g" ${CONTROLLER_ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIINIT_IMAGE_LOCATION}/${INIT_IMAGE_LOCATION}/g" ${CONTROLLER_SCRIPT_FILES}
#read varkey
#
# Change INIT_IMAGE_NAME 
#
CHANGETOPIC=INIT_IMAGE_NAME
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIINIT_IMAGE_NAME}/${INIT_IMAGE_NAME}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIINIT_IMAGE_NAME}/${INIT_IMAGE_NAME}/g" ${SCRIPT_FILES}
#read varkey
#
# Change OPS_MYSQL_PASS 
#
CHANGETOPIC=OPS_MYSQL_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIOPS_MYSQL_PASS}/${OPS_MYSQL_PASS}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIOPS_MYSQL_PASS}/${OPS_MYSQL_PASS}/g" ${SCRIPT_FILES}
#read varkey
printf "\n----------\n"
#
# Change DEMO_PASS 
#
CHANGETOPIC=DEMO_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIDEMO_PASS}/${DEMO_PASS}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIDEMO_PASS}/${DEMO_PASS}/g" ${SCRIPT_FILES}
#read varkey
printf "\n----------\n"
#
# Change ADMIN_PASS 
#
CHANGETOPIC=ADMIN_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} (in etc files) \n\n"
sed -i "s/${ORIADMIN_PASS}/${ADMIN_PASS}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIADMIN_PASS}/${ADMIN_PASS}/g" ${SCRIPT_FILES}
#read varkey
printf "\n----------\n"
#
# Change management network address 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nnetwork address (in etc files) \n"
sed -i "s/${ORIMANAGEMENT_NETWORK}/${MANAGEMENT_NETWORK}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\nnetwork address (in script files) \n"
sed -i "s/${ORIMANAGEMENT_NETWORK}/${MANAGEMENT_NETWORK}/g" ${SCRIPT_FILES}
#read varkey
#
# Change domainname 
#
printf "\n----------\n"
printf "\nDomain name (in etc files) \n"
sed -i "s/${ORIDOMAINNAME}/${DOMAINNAME}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\n\n${CHANGETOPIC} \n\n"
sed -i "s/${ORIDOMAINNAME}/${DOMAINNAME}/g" ${SCRIPT_FILES}
#read varkey
printf "\n----------\n"
#
# Change controller ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nManagement Network gateway IP (in etc files) \n"
sed -i "s/${ORIGATEWAY_IP}/${GATEWAY_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\nManagement Network gateway IP (in etc files) \n"
sed -i "s/${ORIGATEWAY_IP}/${GATEWAY_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change controller ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nController's IP (in etc files) \n"
sed -i "s/${ORICONTROLLER_IP}/${CONTROLLER_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\nController's IP (in etc files) \n"
sed -i "s/${ORICONTROLLER_IP}/${CONTROLLER_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change network ip 
#
printf "\nsubstitution NETWORK_IP\n"

printf "\n----------\n"
printf "\nnetwork's IP (in etc files) \n"
sed -i "s/${ORINETWORK_IP}/${NETWORK_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\nnetwork's IP (in etc files) \n"
sed -i "s/${ORINETWORK_IP}/${NETWORK_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change compute ip 
#
printf "\nsubstitution COMPUTE_IP\n"

printf "\n----------\n"
printf "\ncompute's IP (in etc files) \n"
sed -i "s/${ORICOMPUTE_IP}/${COMPUTE_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\ncompute's IP (in sh files) \n"
sed -i "s/${ORICOMPUTE_IP}/${COMPUTE_IP}/g" ${SCRIPT_FILES}
#read varkey
#
#
# Change compute1ip 
#
printf "\nsubstitution COMPUTE1_IP\n"

printf "\n----------\n"
printf "\ncompute's IP (in etc files) \n"
sed -i "s/${ORICOMPUTE1_IP}/${COMPUTE1_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\n----------\n"
printf "\ncompute's IP (in sh files) \n"
sed -i "s/${ORICOMPUTE1_IP}/${COMPUTE1_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change management network cidr 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nnetwork cidr  (in etc files) \n"
sed -i "s/${ORIEXTERNAL_CIDR}/${EXTERNAL_CIDR}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nnetwork cidr (in script files) \n"
sed -i "s/${ORIEXTERNAL_CIDR}/${EXTERNAL_CIDR}/g" ${SCRIPT_FILES}
#read varkey
#
# Change start floating ip
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nstart floating ip (in script files) \n"
sed -i "s/${ORISTART_FLOATING_IP}/${START_FLOATING_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nstart floating ip (in script files) \n"
sed -i "s/${ORISTART_FLOATING_IP}/${START_FLOATING_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change end floating ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nend floating ip (in script files) \n"
sed -i "s/${ORIEND_FLOATING_IP}/${END_FLOATING_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nend floating ip (in script files) \n"
sed -i "s/${ORIEND_FLOATING_IP}/${END_FLOATING_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change gateway ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ngateway ip (in etc files) \n"
sed -i "s/${ORIEXTERNAL_GATEWAY_IP}/${EXTERNAL_GATEWAY_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ngateway ip (in script files) \n"
sed -i "s/${ORIEXTERNAL_GATEWAY_IP}/${EXTERNAL_GATEWAY_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Change broadcast address 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nbroadcast address (in etc files) \n"
sed -i "s/${ORIMANAGEMENT_BROADCAST_ADDRESS}/${MANAGEMENT_BROADCAST_ADDRESS}/g" ${ETC_FILES}
#read varkey
#
printf "\nbroadcast address (in etc files) \n"
sed -i "s/${ORIMANAGEMENT_BROADCAST_ADDRESS}/${MANAGEMENT_BROADCAST_ADDRESS}/g" ${SCRIPT_FILES}
#read varkey
#
# Data tunel network node ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in etc files) \n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_NODE_IP}/${DATA_TUNNEL_NETWORK_NODE_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in script file) \n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_NODE_IP}/${DATA_TUNNEL_NETWORK_NODE_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Data tunel compute node ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in etc files) \n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE_NODE_IP}/${DATA_TUNNEL_COMPUTE_NODE_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in script file) \n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE_NODE_IP}/${DATA_TUNNEL_COMPUTE_NODE_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Data tunel compute node ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in etc files) \n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE1_NODE_IP}/${DATA_TUNNEL_COMPUTE1_NODE_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in script file) \n"
sed -i "s/${ORIDATA_TUNNEL_COMPUTE1_NODE_IP}/${DATA_TUNNEL_COMPUTE1_NODE_IP}/g" ${SCRIPT_FILES}
#read varkey
#
# Data tunel network address 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in etc files) \n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_ADDRESS}/${DATA_TUNNEL_NETWORK_ADDRESS}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network ip (in script file) \n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_ADDRESS}/${DATA_TUNNEL_NETWORK_ADDRESS}/g" ${SCRIPT_FILES}
#read varkey
#
# local repo ip address 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nlocal repo ip (in etc files) \n"
sed -i "s/${ORILOCAL_REPO}/${LOCAL_REPO}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nlocal repo ip (in script file) \n"
sed -i "s/${ORILOCAL_REPO}/${LOCAL_REPO}/g" ${SCRIPT_FILES}
#read varkey
#
# local security repo ip address 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nlocal repo ip (in etc files) \n"
sed -i "s/${ORILOCAL_SECURITY_REPO}/${LOCAL_SECURITY_REPO}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nlocal repo ip (in script file) \n"
sed -i "s/${ORILOCAL_SECURITY_REPO}/${LOCAL_SECURITY_REPO}/g" ${SCRIPT_FILES}
#read varkey
#
# management network netmask 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nmanage network netmask (in etc files) \n"
sed -i "s/${ORIMANAGEMENT_NETWORK_NETMASK}/${MANAGEMENT_NETWORK_NETMASK}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\nmanage network netmask (in script file) \n"
sed -i "s/${ORIMANAGEMENT_NETWORK_NETMASK}/${MANAGEMENT_NETWORK_NETMASK}/g" ${SCRIPT_FILES}
#read varkey
#
# data network netmask 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network netmask (in etc files) \n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_NETMASK}/${DATA_TUNNEL_NETWORK_NETMASK}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndata network netmask (in script file) \n"
sed -i "s/${ORIDATA_TUNNEL_NETWORK_NETMASK}/${DATA_TUNNEL_NETWORK_NETMASK}/g" ${SCRIPT_FILES}
#read varkey
#
# dns ip 
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndns ip (in etc files) \n"
sed -i "s/${ORIDNS_IP}/${DNS_IP}/g" ${ETC_FILES}
#read varkey
#
printf "\nsubstitution\n"

printf "\n----------\n"
printf "\ndns ip \n"
sed -i "s/${ORIDNS_IP}/${DNS_IP}/g" ${SCRIPT_FILES}
#read varkey
printf "\n----------\n"
#
# get rid of control-m from MS Windows..
#
sed -i "s///g" ${ETC_FILES}
#read varkey
sed -i "s///g" ${SCRIPT_FILES}
#read varkey
#
printf "\ntar the new OPSInstaller directory\n"   
printf "substitution\n"
#read varkey

#
tar cvf OPSInstaller.tar OPSInstaller
mv OPSInstaller.tar OPSInstaller/installer/OPSInstaller.tar
#
printf "Done."
