#!/bin/sh

# Output: Setting Search Domains
# Author: matt.lee@fox.com

SearchDomains="ffe.foxeg.com foxeg.com foxinc.com"

# Set correct DNS search domains

/usr/sbin/networksetup -setsearchdomains "Built-in Ethernet" $SearchDomains
/usr/sbin/networksetup -setsearchdomains "Ethernet" $SearchDomains
/usr/sbin/networksetup -setsearchdomains "Ethernet 1" $SearchDomains
/usr/sbin/networksetup -setsearchdomains "Ethernet 2" $SearchDomains
/usr/sbin/networksetup -setsearchdomains "Thunderbolt Ethernet" $SearchDomains
/usr/sbin/networksetup -setsearchdomains "USB Ethernet" $SearchDomains