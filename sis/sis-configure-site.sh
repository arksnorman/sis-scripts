#!/usr/bin/env bash

branchName=$(echo $1 | sed -e 's/\.//g')
branchPath="/home/www/sis/$branchName"

cp /home/www/data.ini ${branchPath}
chown -R www-data:www-data ${branchPath}
chmod -R 775 ${branchPath}
