#!/bin/bash
#
cd $HOME/OPSInstaller/
pwd
#
newHostname=${1}
newHostManagementIP=${2}
newHostDataTunnelIP=${3}
#
NEWCOMPUTE_ETC_FILES="newcompute/files/*"
#NEWCOMPUTE_SCRIPT_FILES=*/sh
#
ORIG_Hostname=vasabi-1234GenericComputeHostname_hostname4321-ibasav
ORIG_HostManagementIP=vasabi-1234GenericComputeHostname_ip4321-ibasav
ORIG_HostDataTunnelIP=vasabi-1234data_tunnel_GenericComputeHostname_node_ip4321-ibasav
#
sed -i "s/${ORIG_Hostname}/${newHostname}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostManagementIP}/${newHostManagementIP}/g" ${NEWCOMPUTE_ETC_FILES}
sed -i "s/${ORIG_HostDataTunnelIP}/${newHostDataTunnelIP}/g" ${NEWCOMPUTE_ETC_FILES}
