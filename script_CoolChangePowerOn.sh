#!/bin/sh

####################################################################
# Output: Setting Cool Change Startup and Shutdown Time            #
# Author: matt.lee@fox.com                                         #
####################################################################

####################################################################
# wakeorpoweron = Date (MTWRFSU) Time (24 Hour Clock)              #
# shutdown = Date (MTWRFSU) Time (24 Hour Clock)                   #
####################################################################


/usr/bin/pmset -a repeat wakeorpoweron MTWRFSU 05:45:00
