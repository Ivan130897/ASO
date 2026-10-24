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

# Lo he hecho usando el operador or (|). Así, puedo dejar el primer dígito y poner un rango al segundo.
# Con esto puedo limitarlo a 1(6-9), 2(0-9) y 3(0-1).
# Otra opción un poco mas larga es hacer un rango con los dos dígitos [1-3] y [0-9] y luego en el script
# comprobar si está en el rango 16-31, si no, imprimir que la IP es pública.
