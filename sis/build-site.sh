#!/bin/bash


baseDir='/home/www/sis/'

branchName=$1
repositoryUrl=$2

fullDir="$baseDir$branchName"

if [ ! -d "$fullDir" ]; then
	mkdir -p "$fullDir" && cd "$fullDir" && git clone "repositoryUrl" .
fi

git reset --hard
git checkout branchName
git pull
