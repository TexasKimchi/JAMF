#!/bin/bash

# Add Network Admin to Local Admin Group
# author: matt.lee@fox.com 

# Declaring Variables

shortname=`stat -f%Su /dev/console`
realname=`dscl . read /Users/$3 RealName | sed -e '$!d' -e 's/^[ \t]*//'`
adgroupname="MACADMINS"
localgroup=`dscl localhost read /Local/Default/Groups/admin GroupMembership | tr " " "\n" | grep "$3"`
adgroup=`dscl "/Active Directory/FFE/All Domains" -read /Groups/$adgroupname member | grep -o "$realname"`

# Checking AD Group Membership 

# If User is in AD Admin Group but Not Local Admin

if [[ "$realname" == "$adgroup" && "$3" != "$localgroup" ]]; then
   result="User Successfully Added"
   dscl . append /Groups/admin GroupMembership $3
   echo "<result>$result</result>"
   echo $3
   exit

# If User is in AD Admin Group and is a Local Admin

elif [[ "$realname" == "$adgroup" && "$3" == "$localgroup" ]]; then
	result="Admin User Detected"
	echo "<result>$result</result>"
	echo $3
	exit
	
# If User is in AD Admin Group and is a Local Admin

# Ignoring Service Accounts
	
elif [[ "$realname" != "$adgroup"  && "root" == "$localgroup" ]]; then
	result="Service Account Detected"
	echo "<result>$result</result>"
	echo $3
	exit
	
elif [[ "$realname" != "$adgroup"  && "casper" == "$localgroup" ]]; then
	result="Service Account Detected"
	echo "<result>$result</result>"
	echo $3
	exit
	
elif [[ "$realname" != "$adgroup"  && "foxadmin" == "$localgroup" ]]; then
	result="Service Account Detected"
	echo "<result>$result</result>"
	echo $3
	exit
	
# Removing Non Admin users

elif [[ "$realname" != "$adgroup" && "$3" == "$localgroup" ]]; then
	result="Removing Unapproved User"
	dscl . delete /Groups/admin GroupMembership $3
	echo "<result>$result</result>"
	echo $3
	exit
	
fi