#!/bin/sh

# Service Account Creation
# matt.lee@fox.com

# Creating Forescout Service Account
/usr/sbin/jamf createAccount -username "fsuser" -realname "fsuser" -password "adm1nfsus3r!!!" -home /private/var/fsuser -shell "/bin/bash" -hiddenUser

sleep 30

# Moving Forescout Keys
mkdir "/private/var/fsuser/.ssh"
mv "/Library/Application Support/FNG/authorized_keys" "/private/var/fsuser/.ssh/authorized_keys"
mv "/Library/Application Support/FNG/ssh_key.pub" "/private/var/fsuser/.ssh/ssh_key.pub"

# Changing Forescout Key Permissions
chmod -R 777 "/private/var/fsuser/.ssh"

# Creating Foxadmin Account
/usr/sbin/jamf createAccount -username "foxadmin" -realname "foxadmin" -password "jicleb53" -home /private/var/foxadmin -shell "/bin/bash" -hiddenUser -admin

sleep 30

# Hiding Users
defaults write /Library/Preferences/com.apple.loginwindow Hide500Users -bool YES

#Disabling iCloud First Run 
defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/com.apple.SetupAssistant LastSeenCloudProductVersion 10.8

exit 0		## Success
exit 1		## Failure