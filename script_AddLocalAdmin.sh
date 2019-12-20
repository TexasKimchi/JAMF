#!/bin/bash

#####################################
# Move Network Admin to Local Admin #
# author: matt.lee@fox.com          #
#####################################

#######################################
# Setting Variables                   #
# user = Currently logged in user     #
# group = Verifying user is in group  #
#######################################

user=`stat -f%Su /dev/console`
group=`dscl localhost read /Local/Default/Groups/admin GroupMembership | tr " " "\n" | grep "$user"`

#######################################
# Recticulating Splines               #
#######################################

if [[ "$user" == "$group" ]]
then
result="Yes"
/usr/sbin/jamf displayMessage -message "Account already exists"

else
result="No"
/usr/sbin/jamf displayMessage -message "Account added successfully."
dscl . append /Groups/admin GroupMembership $user

fi

echo "<result>$result</result>"