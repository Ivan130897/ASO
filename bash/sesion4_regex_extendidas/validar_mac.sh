#!/bin/bash

re='^([0-9a-fA-F]{2}([:]|[-])){5}[0-9a-fA-F]{2}$'

if [ -z $1 ]; then
	echo "Uso: ./validar_mac.sh <FF:FF:FF:FF:FF:FF> o <ff-ff-ff-ff-ff-ff>"
else
	if [[ $1 =~ $re ]]; then
		echo "$1 es una MAC válda"
	else
		echo "$1 no es una MAC válida"
	fi
fi
