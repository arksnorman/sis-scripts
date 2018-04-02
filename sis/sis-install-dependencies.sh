#!/usr/bin/env bash

branchName=$(echo $1 | sed -e 's/\.//g')
branchPath="/home/www/sis/$branchName"

cp /home/www/parameters.yaml "$branchPath/config/"
cd ${branchPath} && composer update
