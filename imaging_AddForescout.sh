#!/bin/sh

# Forescout Installation
# author: matt.lee@fox.com

# Creating user account  fsuser

dscl . -create /Users/fsuser
dscl . -create /Users/fsuser UserShell /bin/bash
dscl . -create /Users/fsuser RealName "fsuser"
dscl . -create /Users/fsuser UniqueID 103
dscl . -create /Users/fsuser PrimaryGroupID 20
dscl . -create /Users/fsuser NFSHomeDirectory /private/var/fsuser
dscl . -passwd /Users/fsuser adm1nfsus3r!!!\

# Moving Forescout components

mkdir "/private/var/fsuser/.ssh"
mv "/Library/Packages/Forescout/.ssh/authorized_keys" "/private/var/fsuser/.ssh"
mv "/Library/Packages/Forescout/.ssh/ssh_key.pub" "/private/var/fsuser/.ssh"
chmod -R 755 "/Library/Packages/Forescout/.ssh"
chown -R root:wheel  "/private/var/fsuser/.ssh"

exit 0		## Success
exit 1		## Failure
