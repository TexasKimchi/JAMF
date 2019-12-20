#!/bin/sh

# JAMF Image Custom Trigger Call
# author: matt.lee@fox.com

jamf policy -trigger pisecurity
jamf policy -trigger piusercreation

