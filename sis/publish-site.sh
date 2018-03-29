#!/bin/bash

siteName=$2
branchName=$1

# Define the variables with values you want replaced
serverName="$branchName.$siteName"
serverAlias="www.$branchName.$siteName"
documentRoot="/home/www/sis/$branchName/public"
templateFile="/etc/apache2/sites-available/sis-vhost.template"
siteIsEnabled="/etc/apache2/sites-enabled/$serverName.conf"
fileName="/etc/apache2/sites-available/$serverName.conf"

if [ -f "$siteIsEnabled" ]; then
	echo "Site already enabled"
	exit 0
fi

if [ ! -f "$templateFile" ]; then
	echo "vhost template file not found"
	exit 1
fi

# This could also be read in via bash arguments. 
# Google "bash getopts" for more information
# render a template configuration file
# expand variables + preserve formatting
# user="Venkatt"
# referenced inside the template.txt as $user
# render_template /path/to/template.txt > path/to/configuration_file
function renderTemplate() {
    eval "echo \"$(cat $1)\""
}

function generateConf {
  echo "#### Creating /tmp/httpd.conf from template ./httpd.conf.tmpl"
  renderTemplate "$templatePath" > "$fileName"
}

generateConf

a2ensite "$serverName.conf"

service apache2 restart