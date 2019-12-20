#!/bin/sh

# Bound AD Object
# author: matt.lee@fox.com

adObject=`dsconfigad -show | awk '/Computer Account/{print $NF}'`
echo "<result>$adObject</result>"