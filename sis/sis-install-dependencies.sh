#!/usr/bin/env bash

branchName=$(echo $1 | sed -e 's/\.//g')
branchPath="/home/www/sis/$branchName"

cd ${branchPath} && composer update
