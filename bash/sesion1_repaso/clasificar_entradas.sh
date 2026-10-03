#!/bin/bash

for i in ~/prueba_bash/*; do
	if [ -f "$i" ]; then
		echo $(basename "$i") "fichero"
	elif [ -d "$i" ]; then
		echo $(basename "$i") "directorio"
	fi
done
