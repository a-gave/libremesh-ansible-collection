#!/bin/bash


default_ipv4={{ ipv4_address_template }}
default_ap_ssid={{ ap_ssid }}

# calcola N1 N2
N1=$(echo ${default_ap_ssid: :1})


echo $N1

# calcola

# ipv4_netmask

# ipv4_network

# ipv4_host

# ipv4_address

# ipv4_full_address:



# example


function applyMacTemplate16(template, mac) {
  for i in [1,6,1];
  do template = mac
  concatena mac completo a i
  sottrai mac[i]

  ; done

}


function utils.applyMacTemplate16(template, mac)
	for i=1,6,1 do template = template:gsub("%%M"..i, mac[i]) end
	local macid = utils.get_id(mac)
	for i=1,6,1 do template = template:gsub("%%m"..i, macid[i]) end
	return template
end