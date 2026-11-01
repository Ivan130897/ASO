#!/bin/bash

reg='^[0-9]{1,3}$'

if [ -z "$1" ]; then
        echo "Uso: ./caducidad.sh 90"
else
	if [[ $1 =~ $reg ]]; then
		sed -i.bak "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $1/" login.defs
	else
		echo "$1 no es un número de dias válido."
	fi
fi
