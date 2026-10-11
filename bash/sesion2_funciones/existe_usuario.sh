#!/bin/bash

usuario=$1

existe_usuario() {
	if id "$1" &>/dev/null; then
		echo "El usuario $usuario existe en el sistema."
	else
		echo "El usuario $usuario no existe."
	fi
}

existe_usuario $usuario
