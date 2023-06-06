#!/bin/bash

[ $1 = "" ] && exit
mac=$1
mac_5=$(echo ${mac: -4:2})
mac_6=$(echo ${mac: -2})
ip_c=$(echo $((0x$mac_5)))
ip_d=$(echo $((0x$mac_6)))

if [[ $2 = "--ip-c-start-from" ]]
then
  [[ $ip_c -lt $3 ]] && ((ip_c+=$3))
fi

echo ${ip_c}.${ip_d}