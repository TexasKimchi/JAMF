#!/bin/bash

# Add Network Admin to Local Admin Group
# author: matt.lee@fox.com 

# Declaring Variables

realname=`dscl . read /Users/$3 RealName | sed -e '$!d' -e 's/^[ \t]*//'`
adgroupname="MACADMINS"
localgroup=`dscl localhost read /Local/Default/Groups/admin GroupMembership | tr " " "\n" | grep "$3"`
adgroup=`dscl "/Active Directory/FFE/All Domains" -read /Groups/$adgroupname member | grep -o "$realname"`

# Checking AD Group Membership 

# If User is in AD Admin Group but Not Local Admin

if [[ "$realname" == "$adgroup" && "$3" != "$localgroup" ]]; then
		dscl . append /Groups/admin GroupMembership $3
			echo $3 "successfully added"
   exit

# If User is in AD Admin Group and is a Local Admin

elif [[ "$realname" == "$adgroup" && "$3" == "$localgroup" ]]; then
		echo $3 "is already a Local Admin"
	exit
	
# If User is not in the AD  Group

elif [[ "$realname" != "$adgroup" && "$3" == "$localgroup" ]]; then
		echo $3 "is a Local Admin Only"
	exit

elif [[ "$realname" != "$adgroup" ]]; then
		echo $3 "is not a Network Admin"
	exit
	

	
fi