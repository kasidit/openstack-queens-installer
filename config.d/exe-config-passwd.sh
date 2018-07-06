#!/bin/bash 
#
# OpenStack Installation script 
#
# copyright 2014 kasidit chanchio, vasabilab, 
# http://vasabilab.cs.tu.ac.th
# Department of Computer Science, 
# Faculty of Science and Technology, Thammasat University
#
#
passwdtype=randompass
passwdparam=${PASSWD_TYPE}
#
if [ "$passwdparam" == "$passwdtype" ]
then
#
export RABBIT_PASS=$(openssl rand -hex 10)
export ADMIN_TOKEN=$(openssl rand -hex 10)
export METADATA_SECRET=$(openssl rand -hex 10)
export KEYSTONE_DBPASS=$(openssl rand -hex 10)
export GLANCE_DBPASS=$(openssl rand -hex 10)
export GLANCE_PASS=$(openssl rand -hex 10)
export NOVA_DBPASS=$(openssl rand -hex 10)
export NOVA_PASS=$(openssl rand -hex 10)
export PLACEMENT_PASS=$(openssl rand -hex 10)
export DASH_DBPASS=$(openssl rand -hex 10)
export NEUTRON_DBPASS=$(openssl rand -hex 10)
export NEUTRON_PASS=$(openssl rand -hex 10)
export HEAT_DBPASS=$(openssl rand -hex 10)
export HEAT_PASS=$(openssl rand -hex 10)
export HEAT_DOMAIN_PASS=$(openssl rand -hex 10)
#export CEILOMETER_DBPASS=$(openssl rand -hex 10)
#export CEILOMETER_PASS=$(openssl rand -hex 10)
#
else
#
export RABBIT_PASS=RABBIT_PASS
export ADMIN_TOKEN=ADMIN_TOKEN
export METADATA_SECRET=METADATA_SECRET
export KEYSTONE_DBPASS=KEYSTONE_DBPASS
export GLANCE_DBPASS=GLANCE_DBPASS
export GLANCE_PASS=GLANCE_PASS
export NOVA_DBPASS=NOVA_DBPASS
export NOVA_PASS=NOVA_PASS
export PLACEMENT_PASS=PLACEMENT_PASS
export DASH_DBPASS=DASH_DBPASS
export NEUTRON_DBPASS=NEUTRON_DBPASS
export NEUTRON_PASS=NEUTRON_PASS
export HEAT_DBPASS=HEAT_DBPASS
export HEAT_PASS=HEAT_PASS
export HEAT_DOMAIN_PASS=HEAT_DOMAIN_PASS
#export CEILOMETER_DBPASS=CEILOMETER_DBPASS
#export CEILOMETER_PASS=CEILOMETER_PASS
#
fi

export ORIOPS_MYSQL_PASS=vasabilabMYSQL_PASS

export ORIRABBIT_PASS=vasabilabRABBIT_PASS
export ORIADMIN_TOKEN=vasabilabADMIN_TOKEN
export ORIMETADATA_SECRET=vasabilabMETADATA_SECRET
export ORIKEYSTONE_DBPASS=vasabilabKEYSTONE_DBPASS
export ORIGLANCE_DBPASS=vasabilabGLANCE_DBPASS
export ORIGLANCE_PASS=vasabilabGLANCE_PASS
export ORINOVA_DBPASS=vasabilabNOVA_DBPASS
export ORINOVA_PASS=vasabilabNOVA_PASS
export ORIPLACEMENT_PASS=vasabilabPLACEMENT_PASS
export ORIDASH_DBPASS=vasabilabDASH_DBPASS
export ORINEUTRON_DBPASS=vasabilabNEUTRON_DBPASS
export ORINEUTRON_PASS=vasabilabNEUTRON_PASS
export ORIHEAT_DBPASS=vasabilabHEAT_DBPASS
export ORIHEAT_PASS=vasabilabHEAT_PASS
export ORIHEAT_DOMAIN_PASS=vasabilabHEAT_DOMAIN_PASS
#export ORICEILOMETER_DBPASS=vasabilabCEILOMETER_DBPASS
#export ORICEILOMETER_PASS=vasabilabCEILOMETER_PASS
#
# Password Propagation 
#
ETC_FILES=OPSInstaller/*/files/*
SCRIPT_FILES=OPSInstaller/*/*.sh
#
CONTROLLER_ETC_FILES=OPSInstaller/controller/files/*
CONTROLLER_SCRIPT_FILES=OPSInstaller/controller/*.sh
#
# Change RABBIT_PASS 
#
CHANGETOPIC=RABBIT_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIRABBIT_PASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIRABBIT_PASS}/${RABBIT_PASS}/g" ${ETC_FILES}
grep -n "${RABBIT_PASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIRABBIT_PASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIRABBIT_PASS}/${RABBIT_PASS}/g" ${SCRIPT_FILES}
grep -n "${RABBIT_PASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change ADMIN_TOKEN 
#
CHANGETOPIC=ADMIN_TOKEN
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIADMIN_TOKEN}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIADMIN_TOKEN}/${ADMIN_TOKEN}/g" ${ETC_FILES}
grep -n "${ADMIN_TOKEN}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIADMIN_TOKEN}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIADMIN_TOKEN}/${ADMIN_TOKEN}/g" ${SCRIPT_FILES}
grep -n "${ADMIN_TOKEN}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change METADATA_SECRET 
#
CHANGETOPIC=METADATA_SECRET
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIMETADATA_SECRET}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIMETADATA_SECRET}/${METADATA_SECRET}/g" ${ETC_FILES}
grep -n "${METADATA_SECRET}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIMETADATA_SECRET}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIMETADATA_SECRET}/${METADATA_SECRET}/g" ${SCRIPT_FILES}
grep -n "${METADATA_SECRET}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change KEYSTONE_DBPASS 
#
CHANGETOPIC=KEYSTONE_DBPASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIKEYSTONE_DBPASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIKEYSTONE_DBPASS}/${KEYSTONE_DBPASS}/g" ${ETC_FILES}
grep -n "${KEYSTONE_DBPASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIKEYSTONE_DBPASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIKEYSTONE_DBPASS}/${KEYSTONE_DBPASS}/g" ${SCRIPT_FILES}
grep -n "${KEYSTONE_DBPASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change GLANCE_DBPASS 
#
CHANGETOPIC=GLANCE_DBPASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIGLANCE_DBPASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIGLANCE_DBPASS}/${GLANCE_DBPASS}/g" ${ETC_FILES}
grep -n "${GLANCE_DBPASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIGLANCE_DBPASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIGLANCE_DBPASS}/${GLANCE_DBPASS}/g" ${SCRIPT_FILES}
grep -n "${GLANCE_DBPASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change GLANCE_PASS 
#
CHANGETOPIC=GLANCE_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIGLANCE_PASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIGLANCE_PASS}/${GLANCE_PASS}/g" ${ETC_FILES}
grep -n "${GLANCE_PASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIGLANCE_PASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIGLANCE_PASS}/${GLANCE_PASS}/g" ${SCRIPT_FILES}
grep -n "${GLANCE_PASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change NOVA_DBPASS 
#
CHANGETOPIC=NOVA_DBPASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINOVA_DBPASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORINOVA_DBPASS}/${NOVA_DBPASS}/g" ${ETC_FILES}
grep -n "${NOVA_DBPASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINOVA_DBPASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORINOVA_DBPASS}/${NOVA_DBPASS}/g" ${SCRIPT_FILES}
grep -n "${NOVA_DBPASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change NOVA_PASS 
#
CHANGETOPIC=NOVA_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINOVA_PASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORINOVA_PASS}/${NOVA_PASS}/g" ${ETC_FILES}
grep -n "${NOVA_PASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINOVA_PASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORINOVA_PASS}/${NOVA_PASS}/g" ${SCRIPT_FILES}
grep -n "${NOVA_PASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change NOVA_PASS 
#
CHANGETOPIC=PLACEMENT_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIPLACEMENT_PASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIPLACEMENT_PASS}/${PLACEMENT_PASS}/g" ${ETC_FILES}
grep -n "${PLACEMENT_PASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIPLACEMENT_PASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIPLACEMENT_PASS}/${PLACEMENT_PASS}/g" ${SCRIPT_FILES}
grep -n "${PLACEMENT_PASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change DASH_DBPASS 
#
CHANGETOPIC=DASH_DBPASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIDASH_DBPASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIDASH_DBPASS}/${DASH_DBPASS}/g" ${ETC_FILES}
grep -n "${DASH_DBPASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIDASH_DBPASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIDASH_DBPASS}/${DASH_DBPASS}/g" ${SCRIPT_FILES}
grep -n "${DASH_DBPASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change NEUTRON_DBPASS 
#
CHANGETOPIC=NEUTRON_DBPASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINEUTRON_DBPASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORINEUTRON_DBPASS}/${NEUTRON_DBPASS}/g" ${ETC_FILES}
grep -n "${NEUTRON_DBPASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINEUTRON_DBPASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORINEUTRON_DBPASS}/${NEUTRON_DBPASS}/g" ${SCRIPT_FILES}
grep -n "${NEUTRON_DBPASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change NEUTRON_PASS 
#
CHANGETOPIC=NEUTRON_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINEUTRON_PASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORINEUTRON_PASS}/${NEUTRON_PASS}/g" ${ETC_FILES}
grep -n "${NEUTRON_PASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORINEUTRON_PASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORINEUTRON_PASS}/${NEUTRON_PASS}/g" ${SCRIPT_FILES}
grep -n "${NEUTRON_PASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change HEAT_PASS 
#
CHANGETOPIC=HEAT_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIHEAT_PASS}" ${CONTROLLER_ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
#grep -n "${ORIHEAT_PASS}" ${ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIHEAT_PASS}/${HEAT_PASS}/g" ${CONTROLLER_ETC_FILES}
#sed -i "s/${ORIHEAT_PASS}/${HEAT_PASS}/g" ${ETC_FILES}
grep -n "${HEAT_PASS}"  ${CONTROLLER_ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#grep -n "${HEAT_PASS}"  ${ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIHEAT_PASS}" ${CONTROLLER_SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
#grep -n "${ORIHEAT_PASS}" ${SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIHEAT_PASS}/${HEAT_PASS}/g" ${CONTROLLER_SCRIPT_FILES}
#sed -i "s/${ORIHEAT_PASS}/${HEAT_PASS}/g" ${SCRIPT_FILES}
grep -n "${HEAT_PASS}" ${CONTROLLER_SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#grep -n "${HEAT_PASS}" ${SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change HEAT_DBPASS 
#
CHANGETOPIC=HEAT_DBPASS
#
printf "\nsubstitution\n"
#
printf "\n----------\n"
grep -n "${ORIHEAT_DBPASS}" ${CONTROLLER_ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIHEAT_DBPASS}/${HEAT_DBPASS}/g" ${CONTROLLER_ETC_FILES}
grep -n "${HEAT_DBPASS}"  ${CONTROLLER_ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIHEAT_DBPASS}" ${CONTROLLER_SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIHEAT_DBPASS}/${HEAT_DBPASS}/g" ${CONTROLLER_SCRIPT_FILES}
grep -n "${HEAT_DBPASS}" ${CONTROLLER_SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
# Change HEAT_DOMAIN_PASS 
#
CHANGETOPIC=HEAT_DOMAIN_PASS
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIHEAT_DOMAIN_PASS}" ${CONTROLLER_ETC_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} (in etc files) changed to\n\n"
sed -i "s/${ORIHEAT_DOMAIN_PASS}/${HEAT_DOMAIN_PASS}/g" ${CONTROLLER_ETC_FILES}
grep -n "${HEAT_DOMAIN_PASS}"  ${CONTROLLER_ETC_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
#
printf "\nsubstitution\n"

printf "\n----------\n"
grep -n "${ORIHEAT_DOMAIN_PASS}" ${CONTROLLER_SCRIPT_FILES} | tee ./tmpfile ; wc -l ./tmpfile
printf "\n\n${CHANGETOPIC} changed to\n\n"
sed -i "s/${ORIHEAT_DOMAIN_PASS}/${HEAT_DOMAIN_PASS}/g" ${CONTROLLER_SCRIPT_FILES}
grep -n "${HEAT_DOMAIN_PASS}" ${CONTROLLER_SCRIPT_FILES}  | tee ./tmpfile ; wc -l ./tmpfile 
printf "\n----------\n"
#
printf "Done propagating randomized passwords\n"

