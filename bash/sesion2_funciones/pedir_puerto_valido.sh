#!/bin/bash

pedir_puerto_valido () {
	read -p "Inserta un puerto: " puerto
	until [[ $puerto =~ ^[0-9]+$ && $puerto -ge 1 && $puerto -le 65535 ]]; do
		echo "Inserta un puerto válido."
		read -p "Inserta un puerto: " puerto
	done
	echo "Puerto valido recibido: $puerto"
}

pedir_puerto_valido

