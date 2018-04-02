#!/usr/bin/env bash

branchName=$(echo $1 | sed -e 's/\.//g')
branchPath="/home/www/sis/$branchName"

cp /home/www/data.ini ${branchPath}
cp /home/www/parameters.yaml "$branchPath/config/"
cp -r /home/www/static "$branchPath/public/"
chown -R www-data:www-data ${branchPath}
chmod -R 775 ${branchPath}
