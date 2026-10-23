#!/bin/bash

alu='^[0-9a-zA-Z._-]+@alu.edu.gva.es$'
edu='^[0-9a-zA-Z._-]+@edu.gva.es$'

if [ -z $1 ]; then
	echo "Uso: <usuario@dominio>"
else
	if [[ $1 =~ $alu ]]; then
		echo "$1 es una cuenta de alumnado"
	elif [[ $1 =~ $edu ]]; then
		echo "$1 es una cuenta de profesorado"
	else
		echo "$1 no es una cuenta educativa"
	fi
fi
