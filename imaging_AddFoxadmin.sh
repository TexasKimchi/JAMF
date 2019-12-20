#!/bin/sh

# Create Foxadmin 
# author: matt.lee@fox.com

dscl . -create /Users/foxadmin
dscl . -create /Users/foxadmin UserShell /bin/bash
dscl . -create /Users/foxadmin RealName "foxadmin"
dscl . -create /Users/foxadmin UniqueID 102
dscl . -create /Users/foxadmin PrimaryGroupID 80
dscl . -create /Users/foxadmin NFSHomeDirectory /private/var/foxadmin
dscl . -passwd /Users/foxadmin jicleb53
dscl . -append /Groups/admin GroupMembership foxadmin

exit 0		## Success
exit 1		## Failure
