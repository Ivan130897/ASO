#!/bin/bash

for i in "$1"/*.log; do
	echo $(basename "$i") $(grep -wc "WARNING" "$i") "WARNING", $(grep -wc "ERROR" "$i") "ERROR"
done

## Ejecutar el script en ~/prueba_bash, encuentra sistema.log. Este script no busca recursivamente, asi que no puede
## ver dentro de las carpetas. Esto para una monitorización real no es recomendable ya que los logs suelen
## guardarse en diferentes carpetas.
