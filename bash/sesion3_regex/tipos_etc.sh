#!/bin/bash

conf='\.conf$'
bak='\.bak$'
temporal='\~$'

countconf=0
countbak=0

echo "Ficheros de configuración:"
for fichero in /etc/* ; do
	if [[ $fichero =~ $conf ]]; then
		echo $fichero
		(( countconf ++ ))
	elif [[ $fichero =~ $bak ]]; then
		(( countbak ++ ))
	elif [[ $fichero =~ $temporal ]]; then
		(( countbak ++ ))
	fi
done

echo "----"
echo "Configuración: $countconf"
echo "Copias de seguridad: $countbak"
