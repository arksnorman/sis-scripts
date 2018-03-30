#!/usr/bin/env bash

baseDir='/home/www/sis/'

branchName=$1
repositoryUrl=$2
cleanBranchName=$(echo $1 | sed -e 's/\.//g')

fullDir="$baseDir$cleanBranchName"

if [ ! -d "$fullDir" ]; then
    mkdir -p "$fullDir" && cd "$fullDir" && git clone "repositoryUrl" .
fi

cd ${fullDir} && git reset --hard && git checkout ${branchName} && git pull
