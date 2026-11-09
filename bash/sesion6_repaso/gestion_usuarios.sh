#!/bin/bash

rex1='^([A-Za-z]+ ){2}([A-Za-z]+)$'
rex2='^alu[a-z]{5}$'

#Nota: Faltan las funciones

if  [[ -z $1 ]]; then
	echo "Error: no se ha especificado la acción (alta/baja)"
fi
if [[ $1 = "alta" ]]; then
	read -p "Introduce tu nombre completo: " nombrec
	if ! [[ $nombrec =~ $rex1 ]]; then
		echo "Error: El nombre introducido no tiene el formato correcto o tiene carácteres incorrectos"
		exit 1
	fi
	if [[ $nombrec =~ $rex1 ]]; then
		nombre=$(echo $nombrec | tr 'A-Z' 'a-z' | cut -d' ' -f1 | cut -c1-2)
		ap1=$(echo $nombrec | tr 'A-Z' 'a-z' | cut -d' ' -f2 | cut -c1-2)
		ap2=$(echo $nombrec | tr 'A-Z' 'a-z' | cut -d' ' -f3 | cut -c1)
		id=$(echo "alu$nombre$ap1$ap2")
	fi
	if id "$id" &>/dev/null; then
		echo "Error: El usuario $id ya existe"
		exit 1
	fi
	echo "useradd -m -s /bin/bash $id"
fi
if [[ $1 = "baja" ]]; then
	if [[ -z $2 ]]; then
		echo "Error: No se ha introducido ningún id de usuario."
		exit 1
	fi
	if ! [[ $2 =~ $rex2 ]]; then
		echo "Error: El id de usuario introducido no tiene un formato válido."
		exit 1
	fi
	if ! id $2 &>/dev/null; then
		echo "Error: El usuario no existe"
		exit 1
	fi
	echo "userdel -r $2"
fi
