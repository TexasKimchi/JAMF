#!/bin/sh

############################
# JAMF Recon Script        #
# author: matt.lee@fox.com #
############################

jamf -mcx

/usr/sbin/jamf displayMessage -message "Please reboot for changes to apply."