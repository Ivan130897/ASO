#!/bin/bash

regex='/bash$'
contador=0

while read -r linea; do
	if [[ $linea =~ $regex ]]; then
		echo ${linea%%:*}
		(( contador ++ ))
	fi
done < /etc/passwd

echo "Usuarios con bash: $contador"
