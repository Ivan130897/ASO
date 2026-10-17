#!/bin/bash

regex='^[a-z][a-z0-9]*$'

read -p "Ingresa un nombre de usuario: " usuario

until [[ $usuario =~ $regex ]]; do
	echo "No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
	read -p "Ingresa un nombre de usuario: " usuario
done

if grep -q "^$usuario:" /etc/passwd; then
	echo "El usuario $usuario ya existe"
else
	echo "Para crearlo: sudo useradd -m -s /bin/bash $usuario"
fi
