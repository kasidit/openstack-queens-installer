# OpenStack Queens installation script 
# on Ubuntu 16.04.4 by kasidit chanchio
# vasabilab, dept of computer science, Thammasat University, Thailand
# copyright 2018 
#
#
#!/bin/bash -x
cd $HOME/newComputeInstaller/controller
pwd
echo "Run this script  as user."
printf "\nCreate nova database tables...\n"

mysql -u root -pvasabilabMYSQL_PASS -e "CREATE DATABASE nova_api;"
mysql -u root -pvasabilabMYSQL_PASS -e "CREATE DATABASE nova;"
mysql -u root -pvasabilabMYSQL_PASS -e "CREATE DATABASE nova_cell0;"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'localhost' IDENTIFIED BY 'vasabilabNOVA_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova_api.* TO 'nova'@'%' IDENTIFIED BY 'vasabilabNOVA_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'localhost' IDENTIFIED BY 'vasabilabNOVA_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova.* TO 'nova'@'%' IDENTIFIED BY 'vasabilabNOVA_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'localhost' IDENTIFIED BY 'vasabilabNOVA_DBPASS';"
mysql -u root -pvasabilabMYSQL_PASS -e "GRANT ALL PRIVILEGES ON nova_cell0.* TO 'nova'@'%' IDENTIFIED BY 'vasabilabNOVA_DBPASS';"
