#!/bin/bash
puerto='^[0-9][0-9]*$'

if [[ -z $1 ]]; then
	echo "Uso: ./puerto.sh <Puerto 1 - 65535>"
	exit
fi

if [[ $1 =~ $puerto ]]; then
	if [[ $1 -ge 1 ]] && [[ $1 -le 65535 ]]; then
		echo "$1 es un puerto válido"
	else
		echo "$1 está fuera de rango (1-65535)"
	fi
else
	echo "$1 no es un número"
fi
