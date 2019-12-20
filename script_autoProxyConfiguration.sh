#!/bin/sh

# Proxy Configuration Setuo
# matthew.lee@barclayscapital.com


# Define Variables
autoProxyURL="http://distribution-pac/spwproxypac/spwproxy.pac"

# Checking for vacant value
if [ "$4" != "" ] && [ "$autoProxyURL" == "" ]; then
autoProxyURL=$4
fi

# Detecting hardware available
/usr/sbin/networksetup -detectnewhardware

IFS=$'\n'

	#Loops through the list of network services
	for i in $(networksetup -listallnetworkservices | tail +2 );
	do
	
		# Get a list of all services
		autoProxyURLLocal=`/usr/sbin/networksetup -getautoproxyurl "$i" | head -1 | cut -c 6-`
		
		# Echo's the name of any matching services & the autoproxyURL's set
		echo "$i Proxy set to $autoProxyURLLocal"
	
		# If the value returned of $autoProxyURLLocal does not match the value of $autoProxyURL for the interface $i, change it.
		if [[ $autoProxyURLLocal != $autoProxyURL ]]; then
			/usr/sbin/networksetup -setautoproxyurl $i $autoProxyURL
			echo "Set auto proxy for $i to $autoProxyURL"
		fi
		
		# Enable auto proxy once set
		/usr/sbin/networksetup -setautoproxystate "$i" on
		echo "Turned on auto proxy for $i" 
	
	done

unset IFS

# Echo that we're done
echo "Auto proxy present, correct & enabled for all interfaces"