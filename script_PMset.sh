#!/bin/sh

#####################################
# Output: Power Management Settings #
# Author: matt.lee@fox.com          #
#####################################


###############################################################
# Display Sleep Time 15 Minutes / Sleep Off / Disk Sleep Off  #
# Wake on Magic Packet On / Applies to All Connections        #
###############################################################

pmset -a displaysleep 15 disksleep 0 sleep 0 womp 1
