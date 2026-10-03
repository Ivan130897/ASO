#!/bin/bash

usado=$1
total=$2

porcentaje=$((( usado * 100 ) / total))

if [[ $porcentaje -lt 70 ]]; then
	echo "OK"
elif [[ $porcentaje -le 89 && $porcentaje -ge 70 ]]; then
	echo "AVISO"
else
	echo "CRÍTICO"
fi
