#!/bin/bash

rex1='^[0-9]+$'
fecha=$(date +%Y%m%d-%H%M%S)

registrar() {
	echo "$1"
	logger -t aso-backup "$1"
}

if [[ -z $1 ]] && [[ -z $2 ]]; then
	directorio=/var/backups
	copias=7

elif [[ -z $1 ]] && [[ -n $2 ]]; then
	directorio=/var/backups
	copias=$2

elif [[ -n $1 ]] && [[ -z $2 ]]; then
	directorio=$1
	copias=7
else
	directorio=$1
	copias=$2
fi

echo $copias
echo $directorio
if ! [[ $copias =~ $rex1 ]]; then
	registrar "Error: $copias no es un número"
	exit 1
elif [[ $copias -lt 1 ]]; then
        registrar "Error: El número de copias debe ser mayor que 0"
        exit 1
elif ! [[ -d $directorio ]]; then
	registrar "Error: El directorio no existe"
	exit 1
fi

tar -czf "$directorio/etc-$fecha.tar.gz" "/etc"
	registrar "Copia creada: $directorio/etc-$fecha.tar.gz"
if [[ $(ls $directorio | wc -l) -gt $copias ]]; then
	registrar "Aviso: El número de copias supera el máximo"
fi
