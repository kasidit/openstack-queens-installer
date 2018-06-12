# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/newComputeInstaller/controller
pwd
echo "Run this script as a user."
printf "\nCreate neutron database...\n"

mysql -u root -pvasabilabMYSQL_PASS -e "CREATE DATABASE neutron;"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'localhost' IDENTIFIED BY 'vasabilabNEUTRON_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON neutron.* TO 'neutron'@'%' IDENTIFIED BY 'vasabilabNEUTRON_DBPASS';"
