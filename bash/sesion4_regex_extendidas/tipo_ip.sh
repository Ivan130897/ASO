#!/bin/bash

loop='^(127\.){1}([0-9]{1,3}[.]){2}[0-9]{1,3}$'
privA='^(10\.){1}([0-9]{1,3}[.]){2}[0-9]{1,3}$'
privB='^(172\.){1}(1[6-9]\.|2[0-9]\.|3[0-1]\.){1}([0-9]{1,3}[.]){1}[0-9]{1,3}$'
privC='^(192\.){1}(168\.){1}([0-9]{1,3}[.]){1}[0-9]{1,3}$'

if [[ $1 =~ $loop ]]; then
	echo $1 "es una dirección loopback"
elif [[ $1 =~ $privA ]]; then
	echo $1 "es una dirección privada"
elif [[ $1 =~ $privB ]]; then
	echo $1 "es una dirección privada"
elif [[ $1 =~ $privC ]]; then
	echo $1 "es una dirección privada"
else
	echo $1 "es una dirección pública"
fi
