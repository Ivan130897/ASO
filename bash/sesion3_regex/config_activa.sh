#!/bin/bash

# Definir filtro expresión regular
regex='^[#]'

# Definir contadores para las lineas
coment=0
util=0

# Crear función para filtrar lineas comentadas y contar lineas
leer_archivo() {
	while read -r linea; do
		if [[ $linea =~ $regex ]]; then
			echo "$linea" > /dev/null
			(( coment ++ ))
		else
			echo "$linea"
			(( util ++ ))
		fi
	done
}

# Comprobar si el archivo tiene parámetros, si no, usa fichero por defecto
if [[ -z $1 ]]; then
	leer_archivo < /etc/login.defs
else
	leer_archivo < $1
fi

# Suma de lineas totales del archivo leído
total=$((coment+util))


# Mostrar contador de lineas con una separación de guiones
echo "----"
echo "Lineas totales: $total"
echo "Lineas útiles: $util"

## El valor "PASS_MAX_DAYS" configura los días que puedes usar una contraseña. Por defecto son 99.999 días, prácticamente ilimitado.
## Si se busca tener un sistema seguro, tener este valor por defecto no es buena idea ya que una contraseña se debería
## de cambiar periódicamente.
