#!/bin/bash

re='^(?=.*[A-Z])(?=.*[0-9])(?=.*[^A-Z0-9a-z]).{12,}$'
recar='.{12,}'
redig='[0-9]+'
remay='[A-Z]+'
resim='[^a-zA-Z0-9]+'


# Comprobar requisitos individuales
if [[ $1 =~ $recar ]]; then
	echo "Tiene almenos 12 carácteres: sí"
else
	echo "Tiene almenos 12 carácteres: no"
fi

if [[ $1 =~ $redig ]]; then
	echo "Tiene algún dígito: si"
else
	echo "Tiene algún dígito: no"
fi

if [[ $1 =~ $remay ]]; then
	echo "Tiene alguna mayúscula: sí"
else
	echo "Tiene alguna mayúscula: no"
fi

if [[ $1 =~ $resim ]]; then
	echo "Tiene algún símbolo: sí"
else
	echo "Tiene algún símbolo: no"
fi

if [[ $1 =~ $re ]]; then
	echo "La contraseña es segura"
else
	echo "La contraseña no es segura"
fi

# NO he conseguido que funcione correctamente la comprobación de toda la contraseña.
# NO he conseguido comprobar si la contraseña es una palabra del diccionario

# La contraseña Caminas2026! de por si es bastante segura, pero podría ser aún más segura
# si se usan carácteres aleatorios.
