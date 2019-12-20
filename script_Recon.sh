#!/bin/sh

############################
# JAMF Recon Script        #
# author: matt.lee@fox.com #
############################

jamf -recon

/usr/sbin/jamf displayMessage -message "Script Execution Complete"