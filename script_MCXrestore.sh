#!/bin/sh

#############################
# MCX Restore               #
# author: matt.lee@fox.com  #
#############################

#############################
# Deleting DSCL Info        #
#############################

dscl . -delete /Computers/localhost

#############################
# Deleting Store MCX        #
#############################

rm -R "/Library/Managed Preferences"

#############################
# Recomposing MCX Data      #
#############################

jamf manage

#############################
# Reboot Message            #
#############################

/usr/sbin/jamf displayMessage -message "Please reboot for changes to apply."