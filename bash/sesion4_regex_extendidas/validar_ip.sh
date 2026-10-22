#!/bin/bash

re='^([0-9]{1,3}[.]){3}[0-9]{1,3}$'

if [ -z $1 ]; then
	echo "Uso: ./validar_ip <123.123.123.123>"
else
	if [[ $1 =~ $re ]]; then
		echo "$1 tiene formato de IP"
	else
		echo "$1 no tiene formato de IP"
	fi
fi


# El script responde que la ip 999.999.999.999 tiene un formato correcto.
# Esto no es verdad ya que el máximo es 255.255.255.255.
# Aparte del formato, se debería revisar que esté en un rango de 0 a 255.
