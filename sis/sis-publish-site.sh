#!/usr/bin/env bash

siteName=$2
branchName=$(echo $1 | sed -e 's/\.//g')

# Define the variables with values you want replaced
serverName="$branchName.$siteName"
serverAlias="www.$branchName.$siteName"
documentRoot="/home/www/sis/$branchName/public"
templateFile="/etc/apache2/sites-available/sis-vhost.template"
siteIsEnabled="/etc/apache2/sites-enabled/$serverName.conf"
fileName="/etc/apache2/sites-available/$serverName.conf"

if [ -f "$siteIsEnabled" ]; then
	echo "Already enabled site"
	exit 0
fi

if [ ! -f "$templateFile" ]; then
	echo "Template file not found"
	exit 1
fi

cp ${templateFile} ${fileName}

sed -i "s|serverName|$serverName|g" ${fileName}
sed -i "s|documentRoot|$documentRoot|g" ${fileName}
sed -i "s|serverAlias|$serverAlias|g" ${fileName}

cd "/etc/apache2/sites-available/" && a2ensite "$serverName.conf"

service apache2 restart
